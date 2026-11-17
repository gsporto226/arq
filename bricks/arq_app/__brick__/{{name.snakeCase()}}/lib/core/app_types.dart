import 'package:{{name.snakeCase()}}/core/app_unavailable.dart';
import 'package:arq/arq.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_types.freezed.dart';
part 'app_types.g.dart';

typedef AppOutcome<E, T> = Outcome<AppUnavailable, E, T>;
typedef AppCommand<I, O, E> = Command<I, O, E, AppUnavailable>;
typedef AppQuery<I, O, E> = Query<I, O, E, AppUnavailable>;

@freezed
abstract class NoInput with _$NoInput {
  @JsonSerializable(createJsonSchema: true)
  const factory NoInput() = _NoInput;

  factory NoInput.fromJson(Map<String, dynamic> json) => _$NoInputFromJson(json);

  static const schema = _$_NoInputJsonSchema;
}
