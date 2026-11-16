import 'package:{{name.snakeCase()}}/features/greeting/_providers/greeting_providers.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'use_cases.g.dart';

@Riverpod(keepAlive: true)
List<UseCase<dynamic, dynamic, dynamic>> useCases(Ref ref) => [
  ref.watch(setGreetingCommandProvider),
  ref.watch(greetingQueryProvider),
];
