import 'package:app_template/modules/greeting/mcp/greeting_tools.dart';
import 'package:arq_ai/arq_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tools.g.dart';

@Riverpod(keepAlive: true)
List<McpTool> tools(Ref ref) => [...greetingTools(ref)];
