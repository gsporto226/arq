import 'package:{{name.snakeCase()}}/core/clients/app_clients.dart';
import 'package:{{name.snakeCase()}}/core/clients/greeting_client.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/domain/greeting.dart';
import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

class GreetingFacade {
  GreetingFacade(ClientsBundle bundle) : _clients = [?bundle.online, ?bundle.offline];

  final List<GreetingClient> _clients;

  late final ValueListenable<Async<Result<GreetingError, Greeting>>> $greeting = prioritize(
    [for (final client in _clients) client.watch()],
    none: const GreetingError.noSource(),
  );

  Future<Result<GreetingError, Greeting>> save(String text) => fallback(
    [for (final client in _clients) () => client.save(text)],
    none: const GreetingError.noSource(),
  );
}
