import 'package:arq_ai/arq_ai.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reef_fp/async.dart';
import 'package:reef_fp/result.dart';

part 'fixtures.freezed.dart';
part 'fixtures.g.dart';

@freezed
abstract class AddInput with _$AddInput {
  @JsonSerializable(createJsonSchema: true)
  const factory AddInput({required int a, required int b}) = _AddInput;

  factory AddInput.fromJson(Map<String, dynamic> json) => _$AddInputFromJson(json);

  static const schema = _$_AddInputJsonSchema;
}

@freezed
abstract class Sum with _$Sum {
  const factory Sum({required int sum}) = _Sum;

  factory Sum.fromJson(Map<String, dynamic> json) => _$SumFromJson(json);
}

@freezed
abstract class Empty with _$Empty {
  @JsonSerializable(createJsonSchema: true)
  const factory Empty() = _Empty;

  factory Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  static const schema = _$_EmptyJsonSchema;
}

class AddCommand extends Command<AddInput, Sum, String> {
  AddCommand()
    : super(name: 'add', description: 'Adds two numbers.', inputSchema: AddInput.schema, decodeInput: AddInput.fromJson);

  @override
  Future<Result<String, Sum>> call(AddInput input) async =>
      input.a < 0 ? const Err('negative') : Ok(Sum(sum: input.a + input.b));
}

class GreetingQuery extends Query<Empty, String, String> {
  GreetingQuery()
    : super(name: 'greeting', description: 'Reads the greeting.', inputSchema: Empty.schema, decodeInput: Empty.fromJson);

  final state = ValueNotifier<Async<Result<String, String>>>(const Async.pending());

  @override
  ValueListenable<Async<Result<String, String>>> call(Empty input) => state;
}
