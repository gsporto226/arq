import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/core/clients/app_clients.dart';
import 'package:{{name.snakeCase()}}/core/clients/clients_providers.dart';
import 'package:{{name.snakeCase()}}/core/clients/greeting_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('saving a new greeting shows it on the home page', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appClientsProvider.overrideWithValue(ValueNotifier<AppClients>((online: true, onlineClient: MemoryGreetingClient('Olá!'), offlineClient: null))),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Olá!'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Bom dia');
    await tester.pump();
    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    expect(find.text('Bom dia'), findsOneWidget);
  });
}
