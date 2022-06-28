// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'potential_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PotentialAction _$PotentialActionFromJson(Map<String, dynamic> json) =>
    PotentialAction(
      type: json['@type'] as String?,
      target: json['target'] == null
          ? null
          : Target.fromJson(json['target'] as Map<String, dynamic>),
      queryInput: json['query-input'] as String?,
    );

Map<String, dynamic> _$PotentialActionToJson(PotentialAction instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'target': instance.target,
      'query-input': instance.queryInput,
    };
