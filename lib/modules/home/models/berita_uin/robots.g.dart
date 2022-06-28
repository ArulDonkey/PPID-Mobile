// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Robots _$RobotsFromJson(Map<String, dynamic> json) => Robots(
      index: json['index'] as String?,
      follow: json['follow'] as String?,
      maxSnippet: json['max-snippet'] as String?,
      maxImagePreview: json['max-image-preview'] as String?,
      maxVideoPreview: json['max-video-preview'] as String?,
    );

Map<String, dynamic> _$RobotsToJson(Robots instance) => <String, dynamic>{
      'index': instance.index,
      'follow': instance.follow,
      'max-snippet': instance.maxSnippet,
      'max-image-preview': instance.maxImagePreview,
      'max-video-preview': instance.maxVideoPreview,
    };
