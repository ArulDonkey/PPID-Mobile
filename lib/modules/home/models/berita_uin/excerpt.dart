import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'excerpt.g.dart';

@JsonSerializable()
class Excerpt extends Equatable {
  final String? rendered;
  final bool? protected;

  const Excerpt({this.rendered, this.protected});

  factory Excerpt.fromJson(Map<String, dynamic> json) {
    return _$ExcerptFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExcerptToJson(this);

  Excerpt copyWith({
    String? rendered,
    bool? protected,
  }) {
    return Excerpt(
      rendered: rendered ?? this.rendered,
      protected: protected ?? this.protected,
    );
  }

  @override
  List<Object?> get props => [rendered, protected];
}
