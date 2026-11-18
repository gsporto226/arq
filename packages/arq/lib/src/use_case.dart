import 'package:arq/src/once.dart';
import 'package:arq/src/outcome.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';

/// An input port that changes state.
abstract interface class Command<I, O, E, R extends Reason> {
  Future<Outcome<R, E, O>> call(I input);
}

/// An input port that reads state and never changes it.
abstract interface class Query<I, O, E, R extends Reason> {
  ValueListenable<Async<Outcome<R, E, O>>> call(I input);
}

extension QueryOnce<I, O, E, R extends Reason> on Query<I, O, E, R> {
  /// Reads the query a single time: its first ready value.
  Future<Outcome<R, E, O>> once(I input) => call(input).once();
}
