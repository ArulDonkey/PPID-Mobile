import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wp_attachment.g.dart';

@JsonSerializable()
class WpAttachment extends Equatable {
  final String? href;

  const WpAttachment({this.href});

  factory WpAttachment.fromJson(Map<String, dynamic> json) {
    return _$WpAttachmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WpAttachmentToJson(this);

  WpAttachment copyWith({
    String? href,
  }) {
    return WpAttachment(
      href: href ?? this.href,
    );
  }

  @override
  List<Object?> get props => [href];
}
