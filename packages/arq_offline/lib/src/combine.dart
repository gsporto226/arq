import 'package:flutter/foundation.dart';
import 'package:listenable_plus/listenable_plus.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

/// Runs [attempts] in order until one succeeds. When all fail, the first
/// error wins; with no attempts, fails with [none].
Future<Result<E, T>> fallback<E, T>(
  Iterable<Future<Result<E, T>> Function()> attempts, {
  required E none,
}) async {
  Result<E, T>? firstError;
  for (final attempt in attempts) {
    final result = await attempt();
    if (result is Ok<E, T>) return result;
    firstError ??= result;
  }
  return firstError ?? Err(none);
}

/// Follows [sources] at once, ordered by priority. The highest-priority value
/// shown so far wins, so a lower source shows while higher ones still load;
/// errors wait until every source settles, and then the first error wins.
/// With no sources, fails with [none].
ValueListenable<Async<Result<E, T>>> prioritize<E, T>(
  List<ValueListenable<Async<Result<E, T>>>> sources, {
  required E none,
}) => sources.isEmpty
    ? ValueNotifier(Async.ready(Err(none)))
    : CombineLatestValueNotifier.combine(sources, prioritized);

@visibleForTesting
Async<Result<E, T>> prioritized<E, T>(List<Async<Result<E, T>>> values) {
  for (final value in values) {
    if (value case Ready(value: Ok<E, T>())) return value;
  }
  return values.every((value) => value is Ready) ? values.first : Async<Result<E, T>>.pending();
}
