import 'dart:async';
import 'dart:convert';

import 'package:arq_ai/src/use_case.dart';
import 'package:dart_mcp/server.dart' hide Result;
import 'package:reef_fp/result.dart';

/// An MCP server exposing every command and query in [useCases] as a tool.
/// Queries are read-only tools and answer with their first ready value.
base class ArqMcpServer extends MCPServer with ToolsSupport {
  ArqMcpServer(
    super.channel, {
    required Iterable<UseCase<dynamic, dynamic, dynamic>> useCases,
    required super.implementation,
    super.instructions,
  }) : _useCases = List.of(useCases),
       super.fromStreamChannel();

  final List<UseCase<dynamic, dynamic, dynamic>> _useCases;

  @override
  FutureOr<InitializeResult> initialize(InitializeRequest request) {
    for (final useCase in _useCases) {
      registerTool(
        Tool(
          name: useCase.name,
          description: useCase.description,
          inputSchema: ObjectSchema.fromMap(useCase.inputSchema),
          annotations: ToolAnnotations(readOnlyHint: useCase is Query),
        ),
        (call) => _run(useCase, call.arguments ?? const {}),
      );
    }
    return super.initialize(request);
  }

  Future<CallToolResult> _run<I, O, E>(UseCase<I, O, E> useCase, Map<String, Object?> arguments) async {
    final I input;
    try {
      input = useCase.decodeInput(arguments);
    } on Object catch (error) {
      return _error('Invalid input: $error');
    }
    final result = await useCase.once(input);
    try {
      return switch (result) {
        Ok(:final value) => CallToolResult(content: [TextContent(text: jsonEncode(value))]),
        Err(:final value) => _error(jsonEncode(value)),
      };
    } on JsonUnsupportedObjectError catch (error) {
      return _error('Unencodable result: $error');
    }
  }

  CallToolResult _error(String text) => CallToolResult(isError: true, content: [TextContent(text: text)]);
}
