import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reef_fp/result.dart';

part 'greeting.freezed.dart';
part 'greeting.g.dart';

@freezed
abstract class Greeting with _$Greeting {
  const factory Greeting({required String text}) = _Greeting;

  factory Greeting.fromJson(Map<String, dynamic> json) => _$GreetingFromJson(json);

  static Result<GreetingError, Greeting> create(String text) {
    final trimmed = text.trim();
    return trimmed.isEmpty ? const Err(GreetingError.empty()) : Ok(Greeting(text: trimmed));
  }
}

@freezed
sealed class GreetingError with _$GreetingError {
  const factory GreetingError.empty() = GreetingEmpty;
  const factory GreetingError.noSource() = GreetingNoSource;

  factory GreetingError.fromJson(Map<String, dynamic> json) => _$GreetingErrorFromJson(json);
}
