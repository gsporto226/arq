import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

/// One use case of the app, callable by a viewmodel or by an agent over MCP.
///
/// Inputs are `@freezed` classes whose factory carries
/// `@JsonSerializable(createJsonSchema: true)`: pass the generated schema and
/// `fromJson`. Outputs and errors must encode with `jsonEncode`, which a
/// freezed `toJson` satisfies.
sealed class UseCase<I, O, E> {
  UseCase({
    required this.name,
    required this.description,
    required this.inputSchema,
    required this.decodeInput,
  });

  /// The tool name: `snake_case`, English, after the use case.
  final String name;
  final String description;
  final Map<String, Object?> inputSchema;
  final I Function(Map<String, dynamic> json) decodeInput;

  /// Runs the use case once and returns its settled result.
  Future<Result<E, O>> once(I input);
}

/// A use case that changes state.
abstract class Command<I, O, E> extends UseCase<I, O, E> {
  Command({required super.name, required super.description, required super.inputSchema, required super.decodeInput});

  Future<Result<E, O>> call(I input);

  @override
  Future<Result<E, O>> once(I input) => call(input);
}

/// A use case that reads state and never changes it.
abstract class Query<I, O, E> extends UseCase<I, O, E> {
  Query({required super.name, required super.description, required super.inputSchema, required super.decodeInput});

  ValueListenable<Async<Result<E, O>>> call(I input);

  @override
  Future<Result<E, O>> once(I input) => call(input).once();
}
