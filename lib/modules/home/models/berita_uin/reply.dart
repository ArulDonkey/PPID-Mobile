import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply extends Equatable {
  final bool? embeddable;
  final String? href;

  const Reply({this.embeddable, this.href});

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyToJson(this);

  Reply copyWith({
    bool? embeddable,
    String? href,
  }) {
    return Reply(
      embeddable: embeddable ?? this.embeddable,
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [embeddable, href];
}
