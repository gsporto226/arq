import 'package:arq/arq.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reef_fp/async.dart';

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

class Offline implements Reason {
  const Offline();

  @override
  Map<String, dynamic> toJson() => {'code': 'offline'};
}

class AddCommand implements Command<AddInput, Sum, String, Offline> {
  bool online = true;

  @override
  Future<Outcome<Offline, String, Sum>> call(AddInput input) async => switch ((online, input.a < 0)) {
    (false, _) => const Blocked(Offline()),
    (_, true) => const Failed('negative'),
    _ => Done(Sum(sum: input.a + input.b)),
  };
}

class GreetingQuery implements Query<Empty, String, String, Offline> {
  final state = ValueNotifier<Async<Outcome<Offline, String, String>>>(const Async.pending());

  @override
  ValueListenable<Async<Outcome<Offline, String, String>>> call(Empty input) => state;
}
