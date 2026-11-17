import 'package:app_template/core/app_unavailable.dart';
import 'package:app_template/modules/greeting/infrastructure/greeting_client.dart';
import 'package:app_template/modules/greeting/infrastructure/greeting_facade.dart';
import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/either.dart';

class GreetingAvailability extends Availability<GreetingFacade, List<GreetingClient>, GreetingClients, AppUnavailable> {
  GreetingAvailability(ValueListenable<GreetingClients> state)
    : super(
        state: state,
        decide: (state) => switch (state) {
          (online: false, clients: _) => const Left(AppUnavailable.offline()),
          (online: true, clients: []) => const Left(AppUnavailable.noClients()),
          (online: true, :final clients) => Right(clients),
        },
        facade: GreetingFacade.new,
      );

  late final $save = method((facade) => facade.save);
  late final $greeting = watch((facade) => facade.$greeting);
}
