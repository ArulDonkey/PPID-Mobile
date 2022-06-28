// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'og_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OgImage _$OgImageFromJson(Map<String, dynamic> json) => OgImage(
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$OgImageToJson(OgImage instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'type': instance.type,
    };
