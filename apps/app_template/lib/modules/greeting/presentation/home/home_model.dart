import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
abstract class HomeModel with _$HomeModel {
  const factory HomeModel({@Default('') String draft}) = _HomeModel;

  const HomeModel._();

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  HomeModel withDraft(String value) => copyWith(draft: value);

  bool get canSave => draft.trim().isNotEmpty;
}
