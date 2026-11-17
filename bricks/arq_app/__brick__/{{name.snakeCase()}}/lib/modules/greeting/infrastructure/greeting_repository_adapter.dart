import 'package:{{name.snakeCase()}}/core/app_types.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/greeting_repository.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_availability.dart';
import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/either.dart';
import 'package:reef_fp/unit.dart';

class GreetingRepositoryAdapter implements GreetingRepository {
  GreetingRepositoryAdapter(this._availability);

  final GreetingAvailability _availability;

  @override
  ValueListenable<Async<AppOutcome<GreetingError, Greeting>>> get $greeting => _availability.$greeting;

  @override
  Future<AppOutcome<GreetingError, Unit>> save(Greeting greeting) async => switch (_availability.$save.value) {
    Left(:final value) => Blocked(value),
    Right(value: final save) => Outcome.of((await save(greeting.text)).mapOk((_) => const Unit())),
  };
}
