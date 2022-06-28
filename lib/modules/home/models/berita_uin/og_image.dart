import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'og_image.g.dart';

@JsonSerializable()
class OgImage extends Equatable {
  final int? width;
  final int? height;
  final String? url;
  final String? type;

  const OgImage({this.width, this.height, this.url, this.type});

  factory OgImage.fromJson(Map<String, dynamic> json) {
    return _$OgImageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OgImageToJson(this);

  OgImage copyWith({
    int? width,
    int? height,
    String? url,
    String? type,
  }) {
    return OgImage(
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [width, height, url, type];
}
