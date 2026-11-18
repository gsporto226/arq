import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/result.dart';

void main() {
  test('create trims the text', () {
    expect(Greeting.create('  Oi  '), const Ok<GreetingError, Greeting>(Greeting(text: 'Oi')));
  });

  test('create rejects a blank text', () {
    expect(Greeting.create('   '), const Err<GreetingError, Greeting>(GreetingError.empty()));
  });
}
