import 'package:app_template/core/app_types.dart';
import 'package:app_template/modules/greeting/application/set_greeting/set_greeting_input.dart';
import 'package:app_template/modules/greeting/greeting_providers.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<McpTool> greetingTools(Ref ref) => [
  McpTool.command(
    ref.watch(setGreetingCommandProvider),
    name: 'set_greeting',
    description: 'Replaces the greeting shown on the home screen.',
    inputSchema: SetGreetingInput.schema,
    decodeInput: SetGreetingInput.fromJson,
  ),
  McpTool.query(
    ref.watch(getGreetingQueryProvider),
    name: 'greeting',
    description: 'Reads the greeting shown on the home screen.',
    inputSchema: NoInput.schema,
    decodeInput: NoInput.fromJson,
  ),
];
