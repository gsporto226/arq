import 'package:app_template/core/app_types.dart';
import 'package:app_template/modules/greeting/application/greeting_repository.dart';
import 'package:app_template/modules/greeting/application/set_greeting/set_greeting_input.dart';
import 'package:app_template/modules/greeting/domain/greeting.dart';
import 'package:arq/arq.dart';
import 'package:reef_fp/result.dart';
import 'package:reef_fp/unit.dart';

class SetGreetingCommand implements AppCommand<SetGreetingInput, Unit, GreetingError> {
  SetGreetingCommand(this._greetingRepository);

  final GreetingRepository _greetingRepository;

  @override
  Future<AppOutcome<GreetingError, Unit>> call(SetGreetingInput input) => switch (Greeting.create(input.text)) {
    Err(:final value) => Future.value(Failed(value)),
    Ok(:final value) => _greetingRepository.save(value),
  };
}
