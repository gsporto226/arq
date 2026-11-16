import 'package:{{name.snakeCase()}}/features/greeting/_facades/greeting_client.dart';
import 'package:{{name.snakeCase()}}/features/greeting/_providers/greeting_providers.dart';
import 'package:{{name.snakeCase()}}/use_cases.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:dart_mcp/client.dart' hide Result;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_channel/stream_channel.dart';

void main() {
  late ProviderContainer container;
  late ServerConnection server;

  setUp(() async {
    container = ProviderContainer(
      overrides: [greetingClientsProvider.overrideWithValue(ValueNotifier<List<GreetingClient>>([MemoryGreetingClient('Olá!')]))],
    );
    final channel = StreamChannelController<String>();
    ArqMcpServer(
      channel.foreign,
      useCases: container.read(useCasesProvider),
      implementation: Implementation(name: '{{name.snakeCase()}}', version: '0.1.0'),
    );
    final client = MCPClient(Implementation(name: 'test', version: '0.0.0'));
    server = client.connectServer(channel.local);
    await server.initialize(
      InitializeRequest(
        protocolVersion: ProtocolVersion.latestSupported,
        capabilities: client.capabilities,
        clientInfo: client.implementation,
      ),
    );
    server.notifyInitialized();
  });

  tearDown(() async {
    await server.shutdown();
    container.dispose();
  });

  String text(CallToolResult result) => (result.content.single as TextContent).text;

  test('every use case is a tool', () async {
    final tools = (await server.listTools(ListToolsRequest())).tools;
    expect(tools.map((t) => t.name), unorderedEquals(['set_greeting', 'greeting']));
  });

  test('an agent sets and reads the greeting', () async {
    final set = await server.callTool(CallToolRequest(name: 'set_greeting', arguments: {'text': 'Boa noite'}));
    expect(text(set), '{"text":"Boa noite"}');

    final read = await server.callTool(CallToolRequest(name: 'greeting', arguments: {}));
    expect(text(read), '{"text":"Boa noite"}');
  });

  test('a blank greeting is a tool error', () async {
    final result = await server.callTool(CallToolRequest(name: 'set_greeting', arguments: {'text': ' '}));
    expect(result.isError, true);
    expect(text(result), '{"runtimeType":"empty"}');
  });
}
