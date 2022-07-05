// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_ppid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaPpid _$BeritaPpidFromJson(Map<String, dynamic> json) => BeritaPpid(
      idPost: json['id_post'] as String?,
      idKategori: json['id_kategori'] as String?,
      kategori: json['kategori'] as String?,
      postName: json['post_name'] as String?,
      postTitle: json['post_title'] as String?,
      postContent: json['post_content'] as String?,
      postStatus: json['post_status'] as String?,
      postDate: json['post_date'] == null
          ? null
          : DateTime.parse(json['post_date'] as String),
      postBanner: json['post_banner'] as String?,
      createdBy: json['created_by'] as String?,
      createdByName: json['created_by_name'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      updatedBy: json['updated_by'] as String?,
      updatedByName: json['updated_by_name'] as String?,
      dateUpdated: json['date_updated'] == null
          ? null
          : DateTime.parse(json['date_updated'] as String),
    );

Map<String, dynamic> _$BeritaPpidToJson(BeritaPpid instance) =>
    <String, dynamic>{
      'id_post': instance.idPost,
      'id_kategori': instance.idKategori,
      'kategori': instance.kategori,
      'post_name': instance.postName,
      'post_title': instance.postTitle,
      'post_content': instance.postContent,
      'post_status': instance.postStatus,
      'post_date': instance.postDate?.toIso8601String(),
      'post_banner': instance.postBanner,
      'created_by': instance.createdBy,
      'created_by_name': instance.createdByName,
      'date_created': instance.dateCreated?.toIso8601String(),
      'updated_by': instance.updatedBy,
      'updated_by_name': instance.updatedByName,
      'date_updated': instance.dateUpdated?.toIso8601String(),
    };
