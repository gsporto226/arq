import 'package:{{name.snakeCase()}}/core/app_types.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/get_greeting/get_greeting_query.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/set_greeting/set_greeting_command.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/set_greeting/set_greeting_input.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/presentation/home/home_model.dart';
import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:listenable_plus/listenable_plus.dart';
import 'package:reef/reef.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';
import 'package:reef_fp/unit.dart';

class HomeViewModel extends ViewModel<HomeModel> {
  HomeViewModel(super.initialModel, {required this._setGreeting, required GetGreetingQuery greeting})
    : $greeting = greeting(const NoInput()) {
    draftController = TextEditingController(text: model.draft);
    registerDisposal(draftController.dispose);
    bindText(draftController, $draft, apply: (value) => Ok<Never, HomeModel>(model.withDraft(value)), via: draftOp);
  }

  final SetGreetingCommand _setGreeting;
  final ValueListenable<Async<AppOutcome<GreetingError, Greeting>>> $greeting;

  late final TextEditingController draftController;
  late final draftOp = operation<Unit, Never>();
  late final saveTask = task<AppOutcome<GreetingError, Unit>>();

  ValueListenable<String> get $draft => $model.select((m) => m.draft);
  late final ValueListenable<bool> $canSave = $model.select((m) => m.canSave);

  Future<void> onSave() async {
    await saveTask.run(() => _setGreeting(SetGreetingInput(text: model.draft)));
    if (saveTask.state case Ready(value: Done())) publish(model.withDraft(''));
  }
}
