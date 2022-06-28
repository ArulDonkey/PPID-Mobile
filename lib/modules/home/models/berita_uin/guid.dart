import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guid.g.dart';

@JsonSerializable()
class Guid extends Equatable {
  final String? rendered;

  const Guid({this.rendered});

  factory Guid.fromJson(Map<String, dynamic> json) => _$GuidFromJson(json);

  Map<String, dynamic> toJson() => _$GuidToJson(this);

  Guid copyWith({
    String? rendered,
  }) {
    return Guid(
      rendered: rendered ?? this.rendered,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [rendered];
}
