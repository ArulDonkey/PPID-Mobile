import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'og_image.dart';
import 'robots.dart';
import 'schema.dart';
import 'twitter_misc.dart';

part 'yoast_head_json.g.dart';

@JsonSerializable()
class YoastHeadJson extends Equatable {
  final String? title;
  final Robots? robots;
  final String? canonical;
  @JsonKey(name: 'og_locale')
  final String? ogLocale;
  @JsonKey(name: 'og_type')
  final String? ogType;
  @JsonKey(name: 'og_title')
  final String? ogTitle;
  @JsonKey(name: 'og_description')
  final String? ogDescription;
  @JsonKey(name: 'og_url')
  final String? ogUrl;
  @JsonKey(name: 'og_site_name')
  final String? ogSiteName;
  @JsonKey(name: 'article_publisher')
  final String? articlePublisher;
  @JsonKey(name: 'article_published_time')
  final String? articlePublishedTime;
  @JsonKey(name: 'article_modified_time')
  final String? articleModifiedTime;
  @JsonKey(name: 'og_image')
  final List<OgImage>? ogImage;
  @JsonKey(name: 'twitter_card')
  final String? twitterCard;
  @JsonKey(name: 'twitter_creator')
  final String? twitterCreator;
  @JsonKey(name: 'twitter_site')
  final String? twitterSite;
  @JsonKey(name: 'twitter_misc')
  final TwitterMisc? twitterMisc;
  final Schema? schema;

  const YoastHeadJson({
    this.title,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublisher,
    this.articlePublishedTime,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.twitterCreator,
    this.twitterSite,
    this.twitterMisc,
    this.schema,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) {
    return _$YoastHeadJsonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$YoastHeadJsonToJson(this);

  YoastHeadJson copyWith({
    String? title,
    Robots? robots,
    String? canonical,
    String? ogLocale,
    String? ogType,
    String? ogTitle,
    String? ogDescription,
    String? ogUrl,
    String? ogSiteName,
    String? articlePublisher,
    String? articlePublishedTime,
    String? articleModifiedTime,
    List<OgImage>? ogImage,
    String? twitterCard,
    String? twitterCreator,
    String? twitterSite,
    TwitterMisc? twitterMisc,
    Schema? schema,
  }) {
    return YoastHeadJson(
      title: title ?? this.title,
      robots: robots ?? this.robots,
      canonical: canonical ?? this.canonical,
      ogLocale: ogLocale ?? this.ogLocale,
      ogType: ogType ?? this.ogType,
      ogTitle: ogTitle ?? this.ogTitle,
      ogDescription: ogDescription ?? this.ogDescription,
      ogUrl: ogUrl ?? this.ogUrl,
      ogSiteName: ogSiteName ?? this.ogSiteName,
      articlePublisher: articlePublisher ?? this.articlePublisher,
      articlePublishedTime: articlePublishedTime ?? this.articlePublishedTime,
      articleModifiedTime: articleModifiedTime ?? this.articleModifiedTime,
      ogImage: ogImage ?? this.ogImage,
      twitterCard: twitterCard ?? this.twitterCard,
      twitterCreator: twitterCreator ?? this.twitterCreator,
      twitterSite: twitterSite ?? this.twitterSite,
      twitterMisc: twitterMisc ?? this.twitterMisc,
      schema: schema ?? this.schema,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      robots,
      canonical,
      ogLocale,
      ogType,
      ogTitle,
      ogDescription,
      ogUrl,
      ogSiteName,
      articlePublisher,
      articlePublishedTime,
      articleModifiedTime,
      ogImage,
      twitterCard,
      twitterCreator,
      twitterSite,
      twitterMisc,
      schema,
    ];
  }
}
