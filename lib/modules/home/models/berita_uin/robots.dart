import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'robots.g.dart';

@JsonSerializable()
class Robots extends Equatable {
  final String? index;
  final String? follow;
  @JsonKey(name: 'max-snippet')
  final String? maxSnippet;
  @JsonKey(name: 'max-image-preview')
  final String? maxImagePreview;
  @JsonKey(name: 'max-video-preview')
  final String? maxVideoPreview;

  const Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  factory Robots.fromJson(Map<String, dynamic> json) {
    return _$RobotsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RobotsToJson(this);

  Robots copyWith({
    String? index,
    String? follow,
    String? maxSnippet,
    String? maxImagePreview,
    String? maxVideoPreview,
  }) {
    return Robots(
      index: index ?? this.index,
      follow: follow ?? this.follow,
      maxSnippet: maxSnippet ?? this.maxSnippet,
      maxImagePreview: maxImagePreview ?? this.maxImagePreview,
      maxVideoPreview: maxVideoPreview ?? this.maxVideoPreview,
    );
  }

  @override
  List<Object?> get props {
    return [
      index,
      follow,
      maxSnippet,
      maxImagePreview,
      maxVideoPreview,
    ];
  }
}
