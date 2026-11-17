import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_greeting_input.freezed.dart';
part 'set_greeting_input.g.dart';

@freezed
abstract class SetGreetingInput with _$SetGreetingInput {
  @JsonSerializable(createJsonSchema: true)
  const factory SetGreetingInput({required String text}) = _SetGreetingInput;

  factory SetGreetingInput.fromJson(Map<String, dynamic> json) => _$SetGreetingInputFromJson(json);

  static const schema = _$_SetGreetingInputJsonSchema;
}
