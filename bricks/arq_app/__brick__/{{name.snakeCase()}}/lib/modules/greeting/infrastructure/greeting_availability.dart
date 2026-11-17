import 'package:{{name.snakeCase()}}/core/app_unavailable.dart';
import 'package:{{name.snakeCase()}}/core/clients/app_clients.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_facade.dart';
import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';

class GreetingAvailability extends Availability<GreetingFacade, ClientsBundle, AppClients, AppUnavailable> {
  GreetingAvailability(ValueListenable<AppClients> state)
    : super(state: state, decide: ClientDeciders.any, facade: GreetingFacade.new);

  late final $save = method((facade) => facade.save);
  late final $greeting = watch((facade) => facade.$greeting);
}
