import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/infrastructure/greeting_client.dart';
import 'package:{{name.snakeCase()}}/modules/greeting/greeting_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:task_graph/task_graph.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final greetingClients = FunctionTask<ValueListenable<GreetingClients>>(
    name: 'greeting_clients',
    function: () => ValueNotifier<GreetingClients>((clients: [MemoryGreetingClient('Olá!')], online: true)),
  );
  final graph = TaskGraph()..add(greetingClients);

  final result = await TaskRunner.run(graph);
  if (!result.succeeded) throw StateError(result.summary());

  runApp(
    ProviderScope(
      overrides: [greetingClientsProvider.overrideWithValue(await greetingClients.value)],
      child: const App(),
    ),
  );
}
