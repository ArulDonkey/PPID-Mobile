import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'self.g.dart';

@JsonSerializable()
class Self extends Equatable {
  final String? href;

  const Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);

  Map<String, dynamic> toJson() => _$SelfToJson(this);

  Self copyWith({
    String? href,
  }) {
    return Self(
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href];
}
