import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'berita_ppid.g.dart';

@JsonSerializable()
class BeritaPpid extends Equatable {
  @JsonKey(name: 'id_post')
  final String? idPost;
  @JsonKey(name: 'ids_kategori')
  final String? idsKategori;
  final String? kategori;
  @JsonKey(name: 'post_name')
  final String? postName;
  @JsonKey(name: 'post_title')
  final String? postTitle;
  @JsonKey(name: 'post_content')
  final String? postContent;
  @JsonKey(name: 'post_status')
  final String? postStatus;
  @JsonKey(name: 'post_date')
  final DateTime? postDate;
  @JsonKey(name: 'post_banner')
  final String? postBanner;
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @JsonKey(name: 'created_by_name')
  final String? createdByName;
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @JsonKey(name: 'updated_by')
  final String? updatedBy;
  @JsonKey(name: 'updated_by_name')
  final String? updatedByName;
  @JsonKey(name: 'date_updated')
  final DateTime? dateUpdated;

  const BeritaPpid({
    this.idPost,
    this.idsKategori,
    this.kategori,
    this.postName,
    this.postTitle,
    this.postContent,
    this.postStatus,
    this.postDate,
    this.postBanner,
    this.createdBy,
    this.createdByName,
    this.dateCreated,
    this.updatedBy,
    this.updatedByName,
    this.dateUpdated,
  });

  factory BeritaPpid.fromJson(Map<String, dynamic> json) {
    return _$BeritaPpidFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BeritaPpidToJson(this);

  BeritaPpid copyWith({
    String? idPost,
    String? idsKategori,
    String? kategori,
    String? postName,
    String? postTitle,
    String? postContent,
    String? postStatus,
    DateTime? postDate,
    String? postBanner,
    String? createdBy,
    String? createdByName,
    DateTime? dateCreated,
    String? updatedBy,
    String? updatedByName,
    DateTime? dateUpdated,
  }) {
    return BeritaPpid(
      idPost: idPost ?? this.idPost,
      idsKategori: idsKategori ?? this.idsKategori,
      kategori: kategori ?? this.kategori,
      postName: postName ?? this.postName,
      postTitle: postTitle ?? this.postTitle,
      postContent: postContent ?? this.postContent,
      postStatus: postStatus ?? this.postStatus,
      postDate: postDate ?? this.postDate,
      postBanner: postBanner ?? this.postBanner,
      createdBy: createdBy ?? this.createdBy,
      createdByName: createdByName ?? this.createdByName,
      dateCreated: dateCreated ?? this.dateCreated,
      updatedBy: updatedBy ?? this.updatedBy,
      updatedByName: updatedByName ?? this.updatedByName,
      dateUpdated: dateUpdated ?? this.dateUpdated,
    );
  }

  @override
  List<Object?> get props {
    return [
      idPost,
      idsKategori,
      kategori,
      postName,
      postTitle,
      postContent,
      postStatus,
      postDate,
      postBanner,
      createdBy,
      createdByName,
      dateCreated,
      updatedBy,
      updatedByName,
      dateUpdated,
    ];
  }
}
