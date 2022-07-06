import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'title.dart';

part 'berita_uin.g.dart';

@JsonSerializable()
class BeritaUin extends Equatable {
  final int? id;
  final String? date;
  final String? slug;
  final Title? title;
  @JsonKey(name: 'jetpack_featured_media_url')
  final String? jetpackFeaturedMediaUrl;

  const BeritaUin({
    this.id,
    this.date,
    this.slug,
    this.title,
    this.jetpackFeaturedMediaUrl,
  });

  factory BeritaUin.fromJson(Map<String, dynamic> json) {
    return _$BeritaUinFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BeritaUinToJson(this);

  BeritaUin copyWith({
    int? id,
    String? date,
    String? slug,
    Title? title,
    String? jetpackFeaturedMediaUrl,
  }) {
    return BeritaUin(
      id: id ?? this.id,
      date: date ?? this.date,
      slug: slug ?? this.slug,
      title: title ?? this.title,
      jetpackFeaturedMediaUrl:
          jetpackFeaturedMediaUrl ?? this.jetpackFeaturedMediaUrl,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      date,
      slug,
      title,
      jetpackFeaturedMediaUrl,
    ];
  }
}
