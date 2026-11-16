import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:listenable_plus/listenable_plus.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/either.dart';
import 'package:reef_fp/result.dart';

/// Decides from the app [State] whether a facade can be used right now:
/// `Right(bundle)` with the clients to build it from, or `Left(reason)`.
typedef AvailabilityDecider<Bundle, State, Reason> = Either<Reason, Bundle> Function(State state);

/// Tells whether a [Facade]'s methods can run right now and, if not, why.
///
/// The [Bundle] must have value equality: the facade is rebuilt, and every
/// [watch] re-subscribed, only when the decided bundle changes.
class Availability<Facade, Bundle, State, Reason> {
  Availability({
    required ValueListenable<State> state,
    required AvailabilityDecider<Bundle, State, Reason> decide,
    required Facade Function(Bundle bundle) facade,
  }) : $facade = state.map(decide).distinct().map((decided) => decided.mapRight(facade));

  final ValueListenable<Either<Reason, Facade>> $facade;

  /// Runs an action if the facade is available now.
  Future<Result<E, T>> call<E, T>(
    Future<Result<E, T>> Function(Facade facade) invoke, {
    required E Function(Reason reason) unavailable,
  }) => switch ($facade.value) {
    Left(:final value) => Future.value(Err(unavailable(value))),
    Right(:final value) => invoke(value),
  };

  /// Follows a get across availability changes.
  ValueListenable<Async<Result<E, T>>> watch<E, T>(
    ValueListenable<Async<Result<E, T>>> Function(Facade facade) invoke, {
    required E Function(Reason reason) unavailable,
  }) => $facade.switchListen(
    const Async.pending(),
    (decided) => switch (decided) {
      Left(:final value) => ValueNotifier(Async.ready(Err(unavailable(value)))),
      Right(:final value) => invoke(value),
    },
  );

  /// Reads a get once, if the facade is available now.
  Future<Result<E, T>> once<E, T>(
    ValueListenable<Async<Result<E, T>>> Function(Facade facade) invoke, {
    required E Function(Reason reason) unavailable,
  }) => call((facade) => invoke(facade).once(), unavailable: unavailable);
}
