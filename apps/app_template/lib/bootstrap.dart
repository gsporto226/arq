import 'package:app_template/app.dart';
import 'package:app_template/features/greeting/_facades/greeting_client.dart';
import 'package:app_template/features/greeting/_providers/greeting_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:task_graph/task_graph.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final greetingClients = FunctionTask<ValueListenable<List<GreetingClient>>>(
    name: 'greeting_clients',
    function: () => ValueNotifier([MemoryGreetingClient('Olá!')]),
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
