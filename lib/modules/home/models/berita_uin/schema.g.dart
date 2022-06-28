// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) => Schema(
      context: json['@context'] as String?,
      graph: (json['@graph'] as List<dynamic>?)
          ?.map((e) => Graph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
      '@context': instance.context,
      '@graph': instance.graph,
    };
