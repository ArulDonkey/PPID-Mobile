import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content extends Equatable {
  final String? rendered;
  final bool? protected;

  const Content({this.rendered, this.protected});

  factory Content.fromJson(Map<String, dynamic> json) {
    return _$ContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  Content copyWith({
    String? rendered,
    bool? protected,
  }) {
    return Content(
      rendered: rendered ?? this.rendered,
      protected: protected ?? this.protected,
    );
  }

  @override
  List<Object?> get props => [rendered, protected];
}
