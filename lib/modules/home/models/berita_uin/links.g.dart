// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: (json['self'] as List<dynamic>?)
          ?.map((e) => Self.fromJson(e as Map<String, dynamic>))
          .toList(),
      collection: (json['collection'] as List<dynamic>?)
          ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
      about: (json['about'] as List<dynamic>?)
          ?.map((e) => About.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: (json['author'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionHistory: (json['version-history'] as List<dynamic>?)
          ?.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      predecessorVersion: (json['predecessor-version'] as List<dynamic>?)
          ?.map((e) => PredecessorVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      wpFeaturedmedia: (json['wp:featuredmedia'] as List<dynamic>?)
          ?.map((e) => WpFeaturedmedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      wpAttachment: (json['wp:attachment'] as List<dynamic>?)
          ?.map((e) => WpAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      wpTerm: (json['wp:term'] as List<dynamic>?)
          ?.map((e) => WpTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      curies: (json['curies'] as List<dynamic>?)
          ?.map((e) => Cury.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'collection': instance.collection,
      'about': instance.about,
      'author': instance.author,
      'replies': instance.replies,
      'version-history': instance.versionHistory,
      'predecessor-version': instance.predecessorVersion,
      'wp:featuredmedia': instance.wpFeaturedmedia,
      'wp:attachment': instance.wpAttachment,
      'wp:term': instance.wpTerm,
      'curies': instance.curies,
    };
