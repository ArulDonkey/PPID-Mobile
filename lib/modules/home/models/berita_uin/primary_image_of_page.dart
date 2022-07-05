import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'primary_image_of_page.g.dart';

@JsonSerializable()
class PrimaryImageOfPage extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const PrimaryImageOfPage({this.id});

  factory PrimaryImageOfPage.fromJson(Map<String, dynamic> json) {
    return _$PrimaryImageOfPageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrimaryImageOfPageToJson(this);

  PrimaryImageOfPage copyWith({
    String? id,
  }) {
    return PrimaryImageOfPage(
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id];
}
