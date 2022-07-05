import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wp_featuredmedia.g.dart';

@JsonSerializable()
class WpFeaturedmedia extends Equatable {
  final bool? embeddable;
  final String? href;

  const WpFeaturedmedia({this.embeddable, this.href});

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) {
    return _$WpFeaturedmediaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WpFeaturedmediaToJson(this);

  WpFeaturedmedia copyWith({
    bool? embeddable,
    String? href,
  }) {
    return WpFeaturedmedia(
      embeddable: embeddable ?? this.embeddable,
      href: href ?? this.href,
    );
  }

  @override
  List<Object?> get props => [embeddable, href];
}
