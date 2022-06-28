// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_uin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaUin _$BeritaUinFromJson(Map<String, dynamic> json) => BeritaUin(
      id: json['id'] as int?,
      date: json['date'] as String?,
      dateGmt: json['date_gmt'] as String?,
      guid: json['guid'] == null
          ? null
          : Guid.fromJson(json['guid'] as Map<String, dynamic>),
      modified: json['modified'] as String?,
      modifiedGmt: json['modified_gmt'] as String?,
      slug: json['slug'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      link: json['link'] as String?,
      title: json['title'] == null
          ? null
          : Title.fromJson(json['title'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      excerpt: json['excerpt'] == null
          ? null
          : Excerpt.fromJson(json['excerpt'] as Map<String, dynamic>),
      author: json['author'] as int?,
      featuredMedia: json['featured_media'] as int?,
      commentStatus: json['comment_status'] as String?,
      pingStatus: json['ping_status'] as String?,
      sticky: json['sticky'] as bool?,
      template: json['template'] as String?,
      format: json['format'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      categories:
          (json['categories'] as List<dynamic>?)?.map((e) => e as int).toList(),
      tags: json['tags'] as List<dynamic>?,
      jetpackPublicizeConnections:
          json['jetpack_publicize_connections'] as List<dynamic>?,
      yoastHead: json['yoast_head'] as String?,
      yoastHeadJson: json['yoast_head_json'] == null
          ? null
          : YoastHeadJson.fromJson(
              json['yoast_head_json'] as Map<String, dynamic>),
      jetpackFeaturedMediaUrl: json['jetpack_featured_media_url'] as String?,
      jetpackRelatedPosts: (json['jetpack-related-posts'] as List<dynamic>?)
          ?.map((e) => JetpackRelatedPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      jetpackSharingEnabled: json['jetpack_sharing_enabled'] as bool?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeritaUinToJson(BeritaUin instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'date_gmt': instance.dateGmt,
      'guid': instance.guid,
      'modified': instance.modified,
      'modified_gmt': instance.modifiedGmt,
      'slug': instance.slug,
      'status': instance.status,
      'type': instance.type,
      'link': instance.link,
      'title': instance.title,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'author': instance.author,
      'featured_media': instance.featuredMedia,
      'comment_status': instance.commentStatus,
      'ping_status': instance.pingStatus,
      'sticky': instance.sticky,
      'template': instance.template,
      'format': instance.format,
      'meta': instance.meta,
      'categories': instance.categories,
      'tags': instance.tags,
      'jetpack_publicize_connections': instance.jetpackPublicizeConnections,
      'yoast_head': instance.yoastHead,
      'yoast_head_json': instance.yoastHeadJson,
      'jetpack_featured_media_url': instance.jetpackFeaturedMediaUrl,
      'jetpack-related-posts': instance.jetpackRelatedPosts,
      'jetpack_sharing_enabled': instance.jetpackSharingEnabled,
      '_links': instance.links,
    };
