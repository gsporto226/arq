import 'package:{{name.snakeCase()}}/features/greeting/_data_types/greeting.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_repositories/greeting_repository.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:reef_fp/result.dart';

class SetGreetingCommand extends Command<SetGreetingInput, Greeting, GreetingError> {
  SetGreetingCommand(this._greetings)
    : super(
        name: 'set_greeting',
        description: 'Replaces the greeting shown on the home screen.',
        inputSchema: SetGreetingInput.schema,
        decodeInput: SetGreetingInput.fromJson,
      );

  final GreetingRepository _greetings;

  @override
  Future<Result<GreetingError, Greeting>> call(SetGreetingInput input) => _greetings.save(input.text);
}
