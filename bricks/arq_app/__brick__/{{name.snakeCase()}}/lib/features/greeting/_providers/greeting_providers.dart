import 'package:{{name.snakeCase()}}/features/greeting/_commands/set_greeting_command.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_facades/greeting_client.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_queries/greeting_query.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_repositories/greeting_repository.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_services/greeting_service.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'greeting_providers.g.dart';

@Riverpod(keepAlive: true)
ValueListenable<List<GreetingClient>> greetingClients(Ref ref) => throw UnimplementedError('Overridden by bootstrap');

@Riverpod(keepAlive: true)
GreetingRepository greetingRepository(Ref ref) =>
    GreetingRepository(GreetingService(ref.watch(greetingClientsProvider)));

@Riverpod(keepAlive: true)
SetGreetingCommand setGreetingCommand(Ref ref) => SetGreetingCommand(ref.watch(greetingRepositoryProvider));

@Riverpod(keepAlive: true)
GreetingQuery greetingQuery(Ref ref) => GreetingQuery(ref.watch(greetingRepositoryProvider));
