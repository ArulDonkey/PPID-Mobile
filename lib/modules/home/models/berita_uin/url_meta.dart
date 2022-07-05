import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'url_meta.g.dart';

@JsonSerializable()
class UrlMeta extends Equatable {
  final int? origin;
  final int? position;

  const UrlMeta({this.origin, this.position});

  factory UrlMeta.fromJson(Map<String, dynamic> json) {
    return _$UrlMetaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UrlMetaToJson(this);

  UrlMeta copyWith({
    int? origin,
    int? position,
  }) {
    return UrlMeta(
      origin: origin ?? this.origin,
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props => [origin, position];
}
