import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

abstract interface class GreetingClient {
  ValueListenable<Async<Result<GreetingError, Greeting>>> watch();

  Future<Result<GreetingError, Greeting>> save(String text);
}

class MemoryGreetingClient implements GreetingClient {
  MemoryGreetingClient(String initial) : _greeting = ValueNotifier(Async.ready(Ok(Greeting(text: initial))));

  final ValueNotifier<Async<Result<GreetingError, Greeting>>> _greeting;

  @override
  ValueListenable<Async<Result<GreetingError, Greeting>>> watch() => _greeting;

  @override
  Future<Result<GreetingError, Greeting>> save(String text) async {
    final greeting = Greeting(text: text);
    _greeting.value = Async.ready(Ok(greeting));
    return Ok(greeting);
  }
}
