import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publisher.g.dart';

@JsonSerializable()
class Publisher extends Equatable {
  @JsonKey(name: '@id')
  final String? id;

  const Publisher({this.id});

  factory Publisher.fromJson(Map<String, dynamic> json) {
    return _$PublisherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PublisherToJson(this);

  Publisher copyWith({
    String? id,
  }) {
    return Publisher(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id];
}
