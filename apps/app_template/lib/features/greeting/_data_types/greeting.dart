import 'package:freezed_annotation/freezed_annotation.dart';

part 'greeting.freezed.dart';
part 'greeting.g.dart';

@freezed
abstract class Greeting with _$Greeting {
  const factory Greeting({required String text}) = _Greeting;

  factory Greeting.fromJson(Map<String, dynamic> json) => _$GreetingFromJson(json);
}

@freezed
sealed class GreetingError with _$GreetingError {
  const factory GreetingError.unavailable() = GreetingUnavailable;
  const factory GreetingError.empty() = GreetingEmpty;

  factory GreetingError.fromJson(Map<String, dynamic> json) => _$GreetingErrorFromJson(json);
}

@freezed
abstract class SetGreetingInput with _$SetGreetingInput {
  @JsonSerializable(createJsonSchema: true)
  const factory SetGreetingInput({required String text}) = _SetGreetingInput;

  factory SetGreetingInput.fromJson(Map<String, dynamic> json) => _$SetGreetingInputFromJson(json);

  static const schema = _$_SetGreetingInputJsonSchema;
}

@freezed
abstract class NoInput with _$NoInput {
  @JsonSerializable(createJsonSchema: true)
  const factory NoInput() = _NoInput;

  factory NoInput.fromJson(Map<String, dynamic> json) => _$NoInputFromJson(json);

  static const schema = _$_NoInputJsonSchema;
}
