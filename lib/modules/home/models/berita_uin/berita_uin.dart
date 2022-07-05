import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'content.dart';
import 'excerpt.dart';
import 'guid.dart';
import 'jetpack_related_post.dart';
import 'links.dart';
import 'meta.dart';
import 'title.dart';
import 'yoast_head_json.dart';

part 'berita_uin.g.dart';

@JsonSerializable()
class BeritaUin extends Equatable {
  final int? id;
  final String? date;
  @JsonKey(name: 'date_gmt')
  final String? dateGmt;
  final Guid? guid;
  final String? modified;
  @JsonKey(name: 'modified_gmt')
  final String? modifiedGmt;
  final String? slug;
  final String? status;
  final String? type;
  final String? link;
  final Title? title;
  final Content? content;
  final Excerpt? excerpt;
  final int? author;
  @JsonKey(name: 'featured_media')
  final int? featuredMedia;
  @JsonKey(name: 'comment_status')
  final String? commentStatus;
  @JsonKey(name: 'ping_status')
  final String? pingStatus;
  final bool? sticky;
  final String? template;
  final String? format;
  final Meta? meta;
  final List<int>? categories;
  final List<dynamic>? tags;
  @JsonKey(name: 'jetpack_publicize_connections')
  final List<dynamic>? jetpackPublicizeConnections;
  @JsonKey(name: 'yoast_head')
  final String? yoastHead;
  @JsonKey(name: 'yoast_head_json')
  final YoastHeadJson? yoastHeadJson;
  @JsonKey(name: 'jetpack_featured_media_url')
  final String? jetpackFeaturedMediaUrl;
  @JsonKey(name: 'jetpack-related-posts')
  final List<JetpackRelatedPost>? jetpackRelatedPosts;
  @JsonKey(name: 'jetpack_sharing_enabled')
  final bool? jetpackSharingEnabled;
  @JsonKey(name: '_links')
  final Links? links;

  const BeritaUin({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.jetpackPublicizeConnections,
    this.yoastHead,
    this.yoastHeadJson,
    this.jetpackFeaturedMediaUrl,
    this.jetpackRelatedPosts,
    this.jetpackSharingEnabled,
    this.links,
  });

  factory BeritaUin.fromJson(Map<String, dynamic> json) {
    return _$BeritaUinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BeritaUinToJson(this);

  BeritaUin copyWith({
    int? id,
    String? date,
    String? dateGmt,
    Guid? guid,
    String? modified,
    String? modifiedGmt,
    String? slug,
    String? status,
    String? type,
    String? link,
    Title? title,
    Content? content,
    Excerpt? excerpt,
    int? author,
    int? featuredMedia,
    String? commentStatus,
    String? pingStatus,
    bool? sticky,
    String? template,
    String? format,
    Meta? meta,
    List<int>? categories,
    List<dynamic>? tags,
    List<dynamic>? jetpackPublicizeConnections,
    String? yoastHead,
    YoastHeadJson? yoastHeadJson,
    String? jetpackFeaturedMediaUrl,
    List<JetpackRelatedPost>? jetpackRelatedPosts,
    bool? jetpackSharingEnabled,
    Links? links,
  }) {
    return BeritaUin(
      id: id ?? this.id,
      date: date ?? this.date,
      dateGmt: dateGmt ?? this.dateGmt,
      guid: guid ?? this.guid,
      modified: modified ?? this.modified,
      modifiedGmt: modifiedGmt ?? this.modifiedGmt,
      slug: slug ?? this.slug,
      status: status ?? this.status,
      type: type ?? this.type,
      link: link ?? this.link,
      title: title ?? this.title,
      content: content ?? this.content,
      excerpt: excerpt ?? this.excerpt,
      author: author ?? this.author,
      featuredMedia: featuredMedia ?? this.featuredMedia,
      commentStatus: commentStatus ?? this.commentStatus,
      pingStatus: pingStatus ?? this.pingStatus,
      sticky: sticky ?? this.sticky,
      template: template ?? this.template,
      format: format ?? this.format,
      meta: meta ?? this.meta,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      jetpackPublicizeConnections:
          jetpackPublicizeConnections ?? this.jetpackPublicizeConnections,
      yoastHead: yoastHead ?? this.yoastHead,
      yoastHeadJson: yoastHeadJson ?? this.yoastHeadJson,
      jetpackFeaturedMediaUrl:
          jetpackFeaturedMediaUrl ?? this.jetpackFeaturedMediaUrl,
      jetpackRelatedPosts: jetpackRelatedPosts ?? this.jetpackRelatedPosts,
      jetpackSharingEnabled:
          jetpackSharingEnabled ?? this.jetpackSharingEnabled,
      links: links ?? this.links,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      date,
      dateGmt,
      guid,
      modified,
      modifiedGmt,
      slug,
      status,
      type,
      link,
      title,
      content,
      excerpt,
      author,
      featuredMedia,
      commentStatus,
      pingStatus,
      sticky,
      template,
      format,
      meta,
      categories,
      tags,
      jetpackPublicizeConnections,
      yoastHead,
      yoastHeadJson,
      jetpackFeaturedMediaUrl,
      jetpackRelatedPosts,
      jetpackSharingEnabled,
      links,
    ];
  }
}
