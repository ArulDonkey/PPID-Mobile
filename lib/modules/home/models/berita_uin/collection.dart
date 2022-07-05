import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection extends Equatable {
  final String? href;

  const Collection({this.href});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return _$CollectionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  Collection copyWith({
    String? href,
  }) {
    return Collection(
      href: href ?? this.href,
    );
  }

  @override
  List<Object?> get props => [href];
}
