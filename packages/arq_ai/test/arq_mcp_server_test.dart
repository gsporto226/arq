import 'package:arq_ai/arq_ai.dart';
import 'package:dart_mcp/client.dart' hide Result;
import 'package:flutter_test/flutter_test.dart';
import 'package:reef_fp/async.dart';
import 'package:arq/arq.dart';
import 'package:stream_channel/stream_channel.dart';

import 'fixtures.dart';

void main() {
  late ServerConnection server;
  late GreetingQuery greeting;
  late AddCommand add;

  setUp(() async {
    final controller = StreamChannelController<String>();
    ArqMcpServer(
      controller.foreign,
      tools: [
        McpTool.command(
          add = AddCommand(),
          name: 'add',
          description: 'Adds two numbers.',
          inputSchema: AddInput.schema,
          decodeInput: AddInput.fromJson,
        ),
        McpTool.query(
          greeting = GreetingQuery(),
          name: 'greeting',
          description: 'Reads the greeting.',
          inputSchema: Empty.schema,
          decodeInput: Empty.fromJson,
        ),
      ],
      implementation: Implementation(name: 'test', version: '0.0.0'),
    );
    final client = MCPClient(Implementation(name: 'client', version: '0.0.0'));
    server = client.connectServer(controller.local);
    await server.initialize(
      InitializeRequest(
        protocolVersion: ProtocolVersion.latestSupported,
        capabilities: client.capabilities,
        clientInfo: client.implementation,
      ),
    );
    server.notifyInitialized();
  });

  tearDown(() => server.shutdown());

  test('lists commands and queries as tools with generated schemas', () async {
    final tools = (await server.listTools(ListToolsRequest())).tools;
    expect({for (final t in tools) t.name: t.toolAnnotations?.readOnlyHint}, {'add': false, 'greeting': true});
    expect(tools.firstWhere((t) => t.name == 'add').inputSchema.required, containsAll(['a', 'b']));
  });

  test('a command returns its freezed output as JSON', () async {
    final result = await server.callTool(CallToolRequest(name: 'add', arguments: {'a': 1, 'b': 2}));
    expect(result.isError, isNot(true));
    expect((result.content.single as TextContent).text, '{"sum":3}');
  });

  test('a failure is a tool error with the encoded error', () async {
    final result = await server.callTool(CallToolRequest(name: 'add', arguments: {'a': -1, 'b': 2}));
    expect(result.isError, true);
    expect((result.content.single as TextContent).text, '{"error":"negative"}');
  });

  test('bad input is a tool error', () async {
    final result = await server.callTool(CallToolRequest(name: 'add', arguments: {'a': 'x'}));
    expect(result.isError, true);  });

  test('a blocked call is a tool error with the reason code and payload', () async {
    add.online = false;
    final result = await server.callTool(CallToolRequest(name: 'add', arguments: {'a': 1, 'b': 2}));
    expect(result.isError, true);
    expect((result.content.single as TextContent).text, '{"unavailable":{"code":"offline","payload":{}}}');
  });

  test('a query answers with its first ready value', () async {
    greeting.state.value = const Async.ready(Done('hello'));
    final result = await server.callTool(CallToolRequest(name: 'greeting', arguments: {}));
    expect((result.content.single as TextContent).text, '"hello"');
  });
}
