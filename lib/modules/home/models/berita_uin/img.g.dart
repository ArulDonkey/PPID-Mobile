// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Img _$ImgFromJson(Map<String, dynamic> json) => Img(
      altText: json['alt_text'] as String?,
      src: json['src'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$ImgToJson(Img instance) => <String, dynamic>{
      'alt_text': instance.altText,
      'src': instance.src,
      'width': instance.width,
      'height': instance.height,
    };
