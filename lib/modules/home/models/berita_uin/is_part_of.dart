import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'is_part_of.g.dart';

@JsonSerializable()
class IsPartOf extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const IsPartOf({this.id});

  factory IsPartOf.fromJson(Map<String, dynamic> json) {
    return _$IsPartOfFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IsPartOfToJson(this);

  IsPartOf copyWith({
    String? id,
  }) {
    return IsPartOf(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
