import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breadcrumb.g.dart';

@JsonSerializable()
class Breadcrumb extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const Breadcrumb({this.id});

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return _$BreadcrumbFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreadcrumbToJson(this);

  Breadcrumb copyWith({
    String? id,
  }) {
    return Breadcrumb(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
