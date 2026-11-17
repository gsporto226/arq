import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';

class Offline implements Reason {
  const Offline();

  @override
  Map<String, dynamic> toJson() => {'code': 'offline'};
}

class GreetingQuery implements Query<String, String, String, Offline> {
  final state = ValueNotifier<Async<Outcome<Offline, String, String>>>(const Async.pending());

  @override
  ValueListenable<Async<Outcome<Offline, String, String>>> call(String input) => state;
}

void main() {
  test('query once waits for the first ready value', () async {
    final query = GreetingQuery();
    final result = query.once('');
    query.state.value = const Async.ready(Done('hello'));
    expect(await result, const Done<Offline, String, String>('hello'));
  });
}
