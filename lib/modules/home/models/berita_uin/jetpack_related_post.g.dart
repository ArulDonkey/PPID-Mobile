// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jetpack_related_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JetpackRelatedPost _$JetpackRelatedPostFromJson(Map<String, dynamic> json) =>
    JetpackRelatedPost(
      id: json['id'] as int?,
      url: json['url'] as String?,
      urlMeta: json['url_meta'] == null
          ? null
          : UrlMeta.fromJson(json['url_meta'] as Map<String, dynamic>),
      title: json['title'] as String?,
      date: json['date'] as String?,
      format: json['format'] as bool?,
      excerpt: json['excerpt'] as String?,
      rel: json['rel'] as String?,
      context: json['context'] as String?,
      img: json['img'] == null
          ? null
          : Img.fromJson(json['img'] as Map<String, dynamic>),
      classes: json['classes'] as List<dynamic>?,
    );

Map<String, dynamic> _$JetpackRelatedPostToJson(JetpackRelatedPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'url_meta': instance.urlMeta,
      'title': instance.title,
      'date': instance.date,
      'format': instance.format,
      'excerpt': instance.excerpt,
      'rel': instance.rel,
      'context': instance.context,
      'img': instance.img,
      'classes': instance.classes,
    };
