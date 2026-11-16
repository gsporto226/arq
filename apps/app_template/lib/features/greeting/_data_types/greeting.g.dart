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

GreetingUnavailable _$GreetingUnavailableFromJson(Map<String, dynamic> json) =>
    GreetingUnavailable($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GreetingUnavailableToJson(
  GreetingUnavailable instance,
) => <String, dynamic>{'runtimeType': instance.$type};

GreetingEmpty _$GreetingEmptyFromJson(Map<String, dynamic> json) =>
    GreetingEmpty($type: json['runtimeType'] as String?);

Map<String, dynamic> _$GreetingEmptyToJson(GreetingEmpty instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

_SetGreetingInput _$SetGreetingInputFromJson(Map<String, dynamic> json) =>
    _SetGreetingInput(text: json['text'] as String);

Map<String, dynamic> _$SetGreetingInputToJson(_SetGreetingInput instance) =>
    <String, dynamic>{'text': instance.text};

const _$_SetGreetingInputJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'text': {'type': 'string'},
  },
  'required': ['text'],
};

_NoInput _$NoInputFromJson(Map<String, dynamic> json) => _NoInput();

Map<String, dynamic> _$NoInputToJson(_NoInput instance) => <String, dynamic>{};

const _$_NoInputJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {},
};
