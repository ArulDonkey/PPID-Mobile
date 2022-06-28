// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      type: json['@type'] as String?,
      inLanguage: json['inLanguage'] as String?,
      id: json['@id'] as String?,
      url: json['url'] as String?,
      contentUrl: json['contentUrl'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      caption: json['caption'] as String?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      '@type': instance.type,
      'inLanguage': instance.inLanguage,
      '@id': instance.id,
      'url': instance.url,
      'contentUrl': instance.contentUrl,
      'width': instance.width,
      'height': instance.height,
      'caption': instance.caption,
    };
