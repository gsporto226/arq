import 'package:{{name.snakeCase()}}/core/app_types.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/greeting_repository.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';

class GetGreetingQuery implements AppQuery<NoInput, Greeting, GreetingError> {
  GetGreetingQuery(this._greetingRepository);

  final GreetingRepository _greetingRepository;

  @override
  ValueListenable<Async<AppOutcome<GreetingError, Greeting>>> call(NoInput input) => _greetingRepository.$greeting;
}
