import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const Image({this.id});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    String? id,
  }) {
    return Image(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
