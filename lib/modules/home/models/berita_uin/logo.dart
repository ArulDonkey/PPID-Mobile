import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable()
class Logo extends Equatable {
  @JsonKey(name: '@type')
  final String? type;
  final String? inLanguage;
  @JsonKey(name: '@id')
  final String? id;
  final String? url;
  final String? contentUrl;
  final int? width;
  final int? height;
  final String? caption;

  const Logo({
    this.type,
    this.inLanguage,
    this.id,
    this.url,
    this.contentUrl,
    this.width,
    this.height,
    this.caption,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);

  Logo copyWith({
    String? type,
    String? inLanguage,
    String? id,
    String? url,
    String? contentUrl,
    int? width,
    int? height,
    String? caption,
  }) {
    return Logo(
      type: type ?? this.type,
      inLanguage: inLanguage ?? this.inLanguage,
      id: id ?? this.id,
      url: url ?? this.url,
      contentUrl: contentUrl ?? this.contentUrl,
      width: width ?? this.width,
      height: height ?? this.height,
      caption: caption ?? this.caption,
    );
  }

  @override
  List<Object?> get props {
    return [
      type,
      inLanguage,
      id,
      url,
      contentUrl,
      width,
      height,
      caption,
    ];
  }
}
