import 'package:app_template/app.dart';
import 'package:app_template/core/clients/app_clients.dart';
import 'package:app_template/core/clients/clients_providers.dart';
import 'package:app_template/core/clients/greeting_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:task_graph/task_graph.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appClients = FunctionTask<ValueListenable<AppClients>>(
    name: 'app_clients',
    function: () => ValueNotifier<AppClients>((online: true, onlineClient: MemoryGreetingClient('Olá!'), offlineClient: null)),
  );
  final graph = TaskGraph()..add(appClients);

  final result = await TaskRunner.run(graph);
  if (!result.succeeded) throw StateError(result.summary());

  runApp(
    ProviderScope(
      overrides: [appClientsProvider.overrideWithValue(await appClients.value)],
      child: const App(),
    ),
  );
}
