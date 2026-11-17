import 'package:app_template/modules/greeting/application/get_greeting/get_greeting_query.dart';
import 'package:app_template/modules/greeting/application/greeting_repository.dart';
import 'package:app_template/modules/greeting/application/set_greeting/set_greeting_command.dart';
import 'package:app_template/modules/greeting/infrastructure/greeting_availability.dart';
import 'package:app_template/modules/greeting/infrastructure/greeting_repository_adapter.dart';
import 'package:app_template/core/clients/clients_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'greeting_providers.g.dart';

@Riverpod(keepAlive: true)
GreetingRepository greetingRepository(Ref ref) =>
    GreetingRepositoryAdapter(GreetingAvailability(ref.watch(appClientsProvider)));

@Riverpod(keepAlive: true)
SetGreetingCommand setGreetingCommand(Ref ref) => SetGreetingCommand(ref.watch(greetingRepositoryProvider));

@Riverpod(keepAlive: true)
GetGreetingQuery getGreetingQuery(Ref ref) => GetGreetingQuery(ref.watch(greetingRepositoryProvider));
