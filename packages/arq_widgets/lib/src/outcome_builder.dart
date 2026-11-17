import 'package:arq/arq.dart';
import 'package:flutter/widgets.dart';
import 'package:reef_fp/async.dart';

/// Renders `Async<Outcome<R, E, T>>`: idle and pending render [done] fed with
/// [sample] (the real layout with placeholder data, ready for a skeleton),
/// and each outcome calls its own builder.
class OutcomeBuilder<R extends Reason, E, T> extends StatelessWidget {
  const OutcomeBuilder({
    super.key,
    required this.value,
    required this.sample,
    required this.done,
    required this.failed,
    required this.unavailable,
  });

  final Async<Outcome<R, E, T>> value;
  final T sample;
  final Widget Function(BuildContext context, T value) done;
  final Widget Function(BuildContext context, E error) failed;
  final Widget Function(BuildContext context, R reason) unavailable;

  @override
  Widget build(BuildContext context) => switch (value) {
    Idle() || Pending() => done(context, sample),
    Ready(value: Done(:final value)) => done(context, value),
    Ready(value: Failed(:final error)) => failed(context, error),
    Ready(value: Blocked(:final reason)) => unavailable(context, reason),
  };
}
