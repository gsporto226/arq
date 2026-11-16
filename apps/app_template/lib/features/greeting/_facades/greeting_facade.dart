import 'package:app_template/features/greeting/_data_types/greeting.dart';
import 'package:app_template/features/greeting/_facades/greeting_client.dart';
import 'package:arq_offline/arq_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

class GreetingFacade {
  GreetingFacade(this._clients);

  final List<GreetingClient> _clients;

  late final ValueListenable<Async<Result<GreetingError, Greeting>>> $greeting = prioritize(
    [for (final client in _clients) client.watch()],
    none: const GreetingError.unavailable(),
  );

  Future<Result<GreetingError, Greeting>> save(String text) => fallback(
    [for (final client in _clients) () => client.save(text)],
    none: const GreetingError.unavailable(),
  );
}
