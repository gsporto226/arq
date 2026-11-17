import 'package:arq/arq.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_unavailable.freezed.dart';
part 'app_unavailable.g.dart';

@Freezed(unionKey: 'code', unionValueCase: FreezedUnionCase.snake)
sealed class AppUnavailable with _$AppUnavailable implements Reason {
  const factory AppUnavailable.offline() = Offline;
  const factory AppUnavailable.noClients() = NoClients;

  factory AppUnavailable.fromJson(Map<String, dynamic> json) => _$AppUnavailableFromJson(json);
}
