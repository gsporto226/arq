import 'dart:convert';

import 'package:arq/arq.dart';
import 'package:dart_mcp/server.dart' hide Result;

/// A command or query exposed to agents as an MCP tool.
///
/// The use case knows nothing about MCP: the tool's name, description and
/// input contract live here. Inputs are freezed classes with
/// `@JsonSerializable(createJsonSchema: true)`; outputs, errors and reasons
/// must encode with `jsonEncode`.
final class McpTool {
  McpTool._({required this.name, required this.description, required this.inputSchema, required this.readOnly, required this.run});

  static McpTool command<I, O, E, R extends Reason>(
    Command<I, O, E, R> command, {
    required String name,
    required String description,
    required Map<String, Object?> inputSchema,
    required I Function(Map<String, dynamic> json) decodeInput,
  }) => McpTool._(
    name: name,
    description: description,
    inputSchema: inputSchema,
    readOnly: false,
    run: (arguments) => _call(arguments, decodeInput, command.call),
  );

  static McpTool query<I, O, E, R extends Reason>(
    Query<I, O, E, R> query, {
    required String name,
    required String description,
    required Map<String, Object?> inputSchema,
    required I Function(Map<String, dynamic> json) decodeInput,
  }) => McpTool._(
    name: name,
    description: description,
    inputSchema: inputSchema,
    readOnly: true,
    run: (arguments) => _call(arguments, decodeInput, query.once),
  );

  /// `snake_case`, English, after the use case.
  final String name;
  final String description;
  final Map<String, Object?> inputSchema;
  final bool readOnly;
  final Future<CallToolResult> Function(Map<String, Object?> arguments) run;

  static Future<CallToolResult> _call<I, O, E, R extends Reason>(
    Map<String, Object?> arguments,
    I Function(Map<String, dynamic> json) decodeInput,
    Future<Outcome<R, E, O>> Function(I input) invoke,
  ) async {
    final I input;
    try {
      input = decodeInput(arguments);
    } on Object catch (error) {
      return _error({'invalidInput': '$error'});
    }
    final outcome = await invoke(input);
    try {
      return switch (outcome) {
        Done(:final value) => CallToolResult(content: [TextContent(text: jsonEncode(value))]),
        Failed(:final error) => _error({'error': error}),
        Blocked(:final reason) => _error({
          'unavailable': {'code': reason.code, 'payload': reason.payload},
        }),
      };
    } on JsonUnsupportedObjectError catch (error) {
      return _error({'unencodable': '$error'});
    }
  }

  static CallToolResult _error(Object body) =>
      CallToolResult(isError: true, content: [TextContent(text: jsonEncode(body))]);
}
