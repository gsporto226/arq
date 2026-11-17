import 'dart:async';

import 'package:arq_ai/src/mcp_tool.dart';
import 'package:dart_mcp/server.dart';

/// An MCP server exposing [tools]. Query tools are marked read-only.
base class ArqMcpServer extends MCPServer with ToolsSupport {
  ArqMcpServer(
    super.channel, {
    required Iterable<McpTool> tools,
    required super.implementation,
    super.instructions,
  }) : _tools = List.of(tools),
       super.fromStreamChannel();

  final List<McpTool> _tools;

  @override
  FutureOr<InitializeResult> initialize(InitializeRequest request) {
    for (final tool in _tools) {
      registerTool(
        Tool(
          name: tool.name,
          description: tool.description,
          inputSchema: ObjectSchema.fromMap(tool.inputSchema),
          annotations: ToolAnnotations(readOnlyHint: tool.readOnly),
        ),
        (call) => tool.run(call.arguments ?? const {}),
      );
    }
    return super.initialize(request);
  }
}
