import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable()
class About extends Equatable {
  final String? href;

  const About({this.href});

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);

  Map<String, dynamic> toJson() => _$AboutToJson(this);

  About copyWith({
    String? href,
  }) {
    return About(
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href];
}
