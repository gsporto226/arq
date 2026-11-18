import 'package:arq/arq.dart';
import 'package:arq_widgets/arq_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';

class Offline implements Reason {
  const Offline();

  @override
  Map<String, dynamic> toJson() => {'code': 'offline'};
}

Future<void> pump(WidgetTester tester, Async<Outcome<Offline, String, String>> value) => tester.pumpWidget(
  Directionality(
    textDirection: TextDirection.ltr,
    child: OutcomeBuilder<Offline, String, String>(
      value: value,
      sample: 'sample',
      done: (_, value) => Text('done:$value'),
      failed: (_, error) => Text('failed:$error'),
      unavailable: (_, reason) => Text('unavailable:${reason.code}'),
    ),
  ),
);

void main() {
  testWidgets('idle and pending render the sample', (tester) async {
    await pump(tester, const Async.idle());
    expect(find.text('done:sample'), findsOneWidget);
    await pump(tester, const Async.pending());
    expect(find.text('done:sample'), findsOneWidget);
  });

  testWidgets('each outcome calls its builder', (tester) async {
    await pump(tester, const Async.ready(Done('x')));
    expect(find.text('done:x'), findsOneWidget);
    await pump(tester, const Async.ready(Failed('e')));
    expect(find.text('failed:e'), findsOneWidget);
    await pump(tester, const Async.ready(Blocked(Offline())));
    expect(find.text('unavailable:offline'), findsOneWidget);
  });
}
