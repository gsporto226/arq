import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:listenable_plus/listenable_plus.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/either.dart';
import 'package:reef_fp/result.dart';

/// Decides from the app [State] whether a facade can be used right now:
/// `Right(bundle)` with the clients to build it from, or `Left(reason)`.
typedef AvailabilityDecider<Bundle, State, R extends Reason> = Either<R, Bundle> Function(State state);

/// Tells whether a [Facade]'s methods can run right now and, if not, why.
///
/// [decide] is the default decider; each [method] and [watch] may pass its
/// own. The [Bundle] must have value equality: the facade is rebuilt only
/// when the decided bundle changes.
class Availability<Facade, Bundle, State, R extends Reason> {
  Availability({
    required ValueListenable<State> state,
    required AvailabilityDecider<Bundle, State, R> decide,
    required Facade Function(Bundle bundle) facade,
  }) : this._(state, decide, facade);

  Availability._(this._state, this._decide, this._facade);

  final ValueListenable<State> _state;
  final AvailabilityDecider<Bundle, State, R> _decide;
  final Facade Function(Bundle bundle) _facade;

  ValueListenable<Either<R, Facade>> _facadeFor(AvailabilityDecider<Bundle, State, R>? decide) =>
      _state.map(decide ?? _decide).distinct().map((decided) => decided.mapRight(_facade));

  /// A facade function, reachable only through `Right`: a caller handles the
  /// reason before it can call [pick]'s result.
  ValueListenable<Either<R, F>> method<F>(
    F Function(Facade facade) pick, {
    AvailabilityDecider<Bundle, State, R>? decide,
  }) => _facadeFor(decide).map((decided) => decided.mapRight(pick));

  /// Follows a get across availability changes.
  ValueListenable<Async<Outcome<R, E, T>>> watch<E, T>(
    ValueListenable<Async<Result<E, T>>> Function(Facade facade) invoke, {
    AvailabilityDecider<Bundle, State, R>? decide,
  }) => _facadeFor(decide).switchListen(
    const Async.pending(),
    (decided) => switch (decided) {
      Left(:final value) => ValueNotifier(Async.ready(Blocked(value))),
      Right(:final value) => invoke(value).map((async) => async.map(Outcome<R, E, T>.of)),
    },
  );
}
