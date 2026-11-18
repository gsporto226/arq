// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Greeting _$GreetingFromJson(Map<String, dynamic> json) =>
    _Greeting(text: json['text'] as String);

Map<String, dynamic> _$GreetingToJson(_Greeting instance) => <String, dynamic>{
  'text': instance.text,
};

GreetingEmpty _$GreetingEmptyFromJson(Map<String, dynamic> json) =>
    GreetingEmpty($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GreetingEmptyToJson(GreetingEmpty instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

GreetingNoSource _$GreetingNoSourceFromJson(Map<String, dynamic> json) =>
    GreetingNoSource($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GreetingNoSourceToJson(GreetingNoSource instance) =>
    <String, dynamic>{'runtimeType': instance.$type};
