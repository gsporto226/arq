// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixtures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddInput _$AddInputFromJson(Map<String, dynamic> json) =>
    _AddInput(a: (json['a'] as num).toInt(), b: (json['b'] as num).toInt());

Map<String, dynamic> _$AddInputToJson(_AddInput instance) => <String, dynamic>{
  'a': instance.a,
  'b': instance.b,
};

const _$_AddInputJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'a': {'type': 'integer'},
    'b': {'type': 'integer'},
  },
  'required': ['a', 'b'],
};

_Sum _$SumFromJson(Map<String, dynamic> json) =>
    _Sum(sum: (json['sum'] as num).toInt());

Map<String, dynamic> _$SumToJson(_Sum instance) => <String, dynamic>{
  'sum': instance.sum,
};

_Empty _$EmptyFromJson(Map<String, dynamic> json) => _Empty();

Map<String, dynamic> _$EmptyToJson(_Empty instance) => <String, dynamic>{};

const _$_EmptyJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {},
};
