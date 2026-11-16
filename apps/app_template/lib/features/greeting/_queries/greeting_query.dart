import 'package:app_template/features/greeting/_data_types/greeting.dart';
import 'package:app_template/features/greeting/_repositories/greeting_repository.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

class GreetingQuery extends Query<NoInput, Greeting, GreetingError> {
  GreetingQuery(this._greetings)
    : super(
        name: 'greeting',
        description: 'Reads the greeting shown on the home screen.',
        inputSchema: NoInput.schema,
        decodeInput: NoInput.fromJson,
      );

  final GreetingRepository _greetings;

  @override
  ValueListenable<Async<Result<GreetingError, Greeting>>> call(NoInput input) => _greetings.$greeting;
}
