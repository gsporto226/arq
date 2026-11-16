import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

import 'fixtures.dart';

void main() {
  test('command once runs the command', () async {
    expect(await AddCommand().once(const AddInput(a: 1, b: 2)), const Ok<String, Sum>(Sum(sum: 3)));
  });

  test('query once waits for the first ready value', () async {
    final query = GreetingQuery();
    final result = query.once(const Empty());
    query.state.value = const Async.ready(Ok('hello'));
    expect(await result, const Ok<String, String>('hello'));
  });

  test('the input schema is generated', () {
    expect(AddInput.schema['required'], containsAll(['a', 'b']));
  });
}
