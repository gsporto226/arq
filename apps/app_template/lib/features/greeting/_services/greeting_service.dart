import 'package:app_template/features/greeting/_data_types/greeting.dart';
import 'package:app_template/features/greeting/_facades/greeting_client.dart';
import 'package:app_template/features/greeting/_facades/greeting_facade.dart';
import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/either.dart';
import 'package:reef_fp/result.dart';

enum GreetingUnavailableReason { noClients }

class GreetingService {
  GreetingService(ValueListenable<List<GreetingClient>> clients)
    : _availability = Availability(
        state: clients,
        decide: (clients) => clients.isEmpty ? const Left(GreetingUnavailableReason.noClients) : Right(clients),
        facade: GreetingFacade.new,
      );

  final Availability<GreetingFacade, List<GreetingClient>, List<GreetingClient>, GreetingUnavailableReason> _availability;

  static GreetingError _unavailable(GreetingUnavailableReason _) => const GreetingError.unavailable();

  ValueListenable<Async<Result<GreetingError, Greeting>>> watchGreeting() =>
      _availability.watch((facade) => facade.$greeting, unavailable: _unavailable);

  Future<Result<GreetingError, Greeting>> greetingOnce() =>
      _availability.once((facade) => facade.$greeting, unavailable: _unavailable);

  Future<Result<GreetingError, Greeting>> save(String text) =>
      _availability.call((facade) => facade.save(text), unavailable: _unavailable);
}
