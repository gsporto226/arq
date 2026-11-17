import 'package:reef_fp/result.dart';

/// Why a call cannot run right now: a stable [code] plus a JSON [payload].
///
/// Implement it with a freezed union using `unionKey: 'code'`; [code] and
/// [payload] are read from the generated `toJson`.
abstract interface class Reason {
  Map<String, dynamic> toJson();
}

extension ReasonFields on Reason {
  String get code =>
      toJson()['code'] as String? ??
      (throw StateError('$runtimeType has no "code" in toJson: a freezed Reason union needs unionKey "code" and at least two variants'));

  Map<String, dynamic> get payload => toJson()..remove('code');
}

/// How a call below the viewmodel ended: [Done], [Failed] with a domain
/// error, or [Blocked] because the app cannot run it now.
sealed class Outcome<R extends Reason, E, T> {
  const Outcome();

  factory Outcome.of(Result<E, T> result) => switch (result) {
    Ok(:final value) => Done(value),
    Err(:final value) => Failed(value),
  };
}

final class Done<R extends Reason, E, T> extends Outcome<R, E, T> {
  const Done(this.value);

  final T value;

  @override
  bool operator ==(Object other) => other is Done<R, E, T> && other.value == value;

  @override
  int get hashCode => Object.hash(Done, value);

  @override
  String toString() => 'Done($value)';
}

final class Failed<R extends Reason, E, T> extends Outcome<R, E, T> {
  const Failed(this.error);

  final E error;

  @override
  bool operator ==(Object other) => other is Failed<R, E, T> && other.error == error;

  @override
  int get hashCode => Object.hash(Failed, error);

  @override
  String toString() => 'Failed($error)';
}

final class Blocked<R extends Reason, E, T> extends Outcome<R, E, T> {
  const Blocked(this.reason);

  final R reason;

  @override
  bool operator ==(Object other) => other is Blocked<R, E, T> && other.reason == reason;

  @override
  int get hashCode => Object.hash(Blocked, reason);

  @override
  String toString() => 'Blocked($reason)';
}
