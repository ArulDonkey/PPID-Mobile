import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'img.dart';
import 'url_meta.dart';

part 'jetpack_related_post.g.dart';

@JsonSerializable()
class JetpackRelatedPost extends Equatable {
  final int? id;
  final String? url;
  @JsonKey(name: 'url_meta')
  final UrlMeta? urlMeta;
  final String? title;
  final String? date;
  final bool? format;
  final String? excerpt;
  final String? rel;
  final String? context;
  final Img? img;
  final List<dynamic>? classes;

  const JetpackRelatedPost({
    this.id,
    this.url,
    this.urlMeta,
    this.title,
    this.date,
    this.format,
    this.excerpt,
    this.rel,
    this.context,
    this.img,
    this.classes,
  });

  factory JetpackRelatedPost.fromJson(Map<String, dynamic> json) {
    return _$JetpackRelatedPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JetpackRelatedPostToJson(this);

  JetpackRelatedPost copyWith({
    int? id,
    String? url,
    UrlMeta? urlMeta,
    String? title,
    String? date,
    bool? format,
    String? excerpt,
    String? rel,
    String? context,
    Img? img,
    List<dynamic>? classes,
  }) {
    return JetpackRelatedPost(
      id: id ?? this.id,
      url: url ?? this.url,
      urlMeta: urlMeta ?? this.urlMeta,
      title: title ?? this.title,
      date: date ?? this.date,
      format: format ?? this.format,
      excerpt: excerpt ?? this.excerpt,
      rel: rel ?? this.rel,
      context: context ?? this.context,
      img: img ?? this.img,
      classes: classes ?? this.classes,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      url,
      urlMeta,
      title,
      date,
      format,
      excerpt,
      rel,
      context,
      img,
      classes,
    ];
  }
}
