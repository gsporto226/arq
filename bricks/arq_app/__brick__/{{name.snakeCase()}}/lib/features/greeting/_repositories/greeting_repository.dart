import 'package:{{name.snakeCase()}}/features/greeting/_data_types/greeting.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_services/greeting_service.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

class GreetingRepository {
  GreetingRepository(this._service);

  final GreetingService _service;

  late final ValueListenable<Async<Result<GreetingError, Greeting>>> $greeting = _service.watchGreeting();

  Future<Result<GreetingError, Greeting>> greetingOnce() => _service.greetingOnce();

  Future<Result<GreetingError, Greeting>> save(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return Future.value(const Err(GreetingError.empty()));
    return _service.save(trimmed);
  }
}
