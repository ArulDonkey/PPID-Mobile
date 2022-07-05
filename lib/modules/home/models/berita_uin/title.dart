import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
class Title extends Equatable {
  final String? rendered;

  const Title({this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);

  Title copyWith({
    String? rendered,
  }) {
    return Title(
      rendered: rendered ?? this.rendered,
    );
  }

  @override
  List<Object?> get props => [rendered];
}
