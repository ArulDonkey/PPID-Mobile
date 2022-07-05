import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const Author({this.id});

  factory Author.fromJson(Map<String, dynamic> json) {
    return _$AuthorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  Author copyWith({
    String? id,
  }) {
    return Author(
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id];
}
