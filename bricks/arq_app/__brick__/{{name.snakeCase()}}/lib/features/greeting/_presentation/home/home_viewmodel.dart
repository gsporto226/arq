import 'package:{{name.snakeCase()}}/features/greeting/_commands/set_greeting_command.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_data_types/greeting.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_presentation/home/home_model.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_queries/greeting_query.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:listenable_plus/listenable_plus.dart';
import 'package:reef/reef.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';
import 'package:reef_fp/unit.dart';

class HomeViewModel extends ViewModel<HomeModel> {
  HomeViewModel(super.initialModel, {required this._setGreeting, required GreetingQuery greeting})
    : $greeting = greeting(const NoInput()) {
    draftController = TextEditingController(text: model.draft);
    registerDisposal(draftController.dispose);
    bindText(draftController, $draft, apply: (value) => Ok<Never, HomeModel>(model.withDraft(value)), via: draftOp);
  }

  final SetGreetingCommand _setGreeting;
  final ValueListenable<Async<Result<GreetingError, Greeting>>> $greeting;

  late final TextEditingController draftController;
  late final draftOp = operation<Unit, Never>();
  late final saveOp = operation<Greeting, GreetingError>();

  ValueListenable<String> get $draft => $model.select((m) => m.draft);
  late final ValueListenable<bool> $canSave = $model.select((m) => m.canSave);

  Future<void> onSave() async {
    await saveOp.run(() => _setGreeting(SetGreetingInput(text: model.draft)));
    if (saveOp.state case Ready(value: Ok())) publish(model.withDraft(''));
  }
}
