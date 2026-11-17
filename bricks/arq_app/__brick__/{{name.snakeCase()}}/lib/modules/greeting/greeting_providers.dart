import 'package:{{name.snakeCase()}}/modules/greeting/application/get_greeting/get_greeting_query.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/greeting_repository.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/application/set_greeting/set_greeting_command.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_availability.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_client.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_repository_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'greeting_providers.g.dart';

@Riverpod(keepAlive: true)
ValueListenable<GreetingClients> greetingClients(Ref ref) => throw UnimplementedError('Overridden by bootstrap');

@Riverpod(keepAlive: true)
GreetingRepository greetingRepository(Ref ref) =>
    GreetingRepositoryAdapter(GreetingAvailability(ref.watch(greetingClientsProvider)));

@Riverpod(keepAlive: true)
SetGreetingCommand setGreetingCommand(Ref ref) => SetGreetingCommand(ref.watch(greetingRepositoryProvider));

@Riverpod(keepAlive: true)
GetGreetingQuery getGreetingQuery(Ref ref) => GetGreetingQuery(ref.watch(greetingRepositoryProvider));
