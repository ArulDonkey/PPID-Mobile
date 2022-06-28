import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'img.g.dart';

@JsonSerializable()
class Img extends Equatable {
  @JsonKey(name: 'alt_text')
  final String? altText;
  final String? src;
  final int? width;
  final int? height;

  const Img({this.altText, this.src, this.width, this.height});

  factory Img.fromJson(Map<String, dynamic> json) => _$ImgFromJson(json);

  Map<String, dynamic> toJson() => _$ImgToJson(this);

  Img copyWith({
    String? altText,
    String? src,
    int? width,
    int? height,
  }) {
    return Img(
      altText: altText ?? this.altText,
      src: src ?? this.src,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [altText, src, width, height];
}
