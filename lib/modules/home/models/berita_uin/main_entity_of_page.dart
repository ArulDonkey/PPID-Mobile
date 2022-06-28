import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_entity_of_page.g.dart';

@JsonSerializable()
class MainEntityOfPage extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const MainEntityOfPage({this.id});

  factory MainEntityOfPage.fromJson(Map<String, dynamic> json) {
    return _$MainEntityOfPageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainEntityOfPageToJson(this);

  MainEntityOfPage copyWith({
    String? id,
  }) {
    return MainEntityOfPage(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
