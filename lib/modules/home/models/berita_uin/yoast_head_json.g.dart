// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yoast_head_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoastHeadJson _$YoastHeadJsonFromJson(Map<String, dynamic> json) =>
    YoastHeadJson(
      title: json['title'] as String?,
      robots: json['robots'] == null
          ? null
          : Robots.fromJson(json['robots'] as Map<String, dynamic>),
      canonical: json['canonical'] as String?,
      ogLocale: json['og_locale'] as String?,
      ogType: json['og_type'] as String?,
      ogTitle: json['og_title'] as String?,
      ogDescription: json['og_description'] as String?,
      ogUrl: json['og_url'] as String?,
      ogSiteName: json['og_site_name'] as String?,
      articlePublisher: json['article_publisher'] as String?,
      articlePublishedTime: json['article_published_time'] as String?,
      articleModifiedTime: json['article_modified_time'] as String?,
      ogImage: (json['og_image'] as List<dynamic>?)
          ?.map((e) => OgImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      twitterCard: json['twitter_card'] as String?,
      twitterCreator: json['twitter_creator'] as String?,
      twitterSite: json['twitter_site'] as String?,
      twitterMisc: json['twitter_misc'] == null
          ? null
          : TwitterMisc.fromJson(json['twitter_misc'] as Map<String, dynamic>),
      schema: json['schema'] == null
          ? null
          : Schema.fromJson(json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YoastHeadJsonToJson(YoastHeadJson instance) =>
    <String, dynamic>{
      'title': instance.title,
      'robots': instance.robots,
      'canonical': instance.canonical,
      'og_locale': instance.ogLocale,
      'og_type': instance.ogType,
      'og_title': instance.ogTitle,
      'og_description': instance.ogDescription,
      'og_url': instance.ogUrl,
      'og_site_name': instance.ogSiteName,
      'article_publisher': instance.articlePublisher,
      'article_published_time': instance.articlePublishedTime,
      'article_modified_time': instance.articleModifiedTime,
      'og_image': instance.ogImage,
      'twitter_card': instance.twitterCard,
      'twitter_creator': instance.twitterCreator,
      'twitter_site': instance.twitterSite,
      'twitter_misc': instance.twitterMisc,
      'schema': instance.schema,
    };
