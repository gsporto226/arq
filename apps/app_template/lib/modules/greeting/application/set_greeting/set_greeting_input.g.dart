// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_greeting_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
