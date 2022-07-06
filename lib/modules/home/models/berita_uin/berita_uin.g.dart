// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_uin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaUin _$BeritaUinFromJson(Map<String, dynamic> json) => BeritaUin(
      id: json['id'] as int?,
      date: json['date'] as String?,
      slug: json['slug'] as String?,
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      jetpackFeaturedMediaUrl: json['jetpack_featured_media_url'] as String?,
    );

Map<String, dynamic> _$BeritaUinToJson(BeritaUin instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'slug': instance.slug,
      'title': instance.title,
      'jetpack_featured_media_url': instance.jetpackFeaturedMediaUrl,
    };
