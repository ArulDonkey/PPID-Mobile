// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      type: json['@type'] as String?,
      urlTemplate: json['urlTemplate'] as String?,
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      '@type': instance.type,
      'urlTemplate': instance.urlTemplate,
    };
