import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'target.g.dart';

@JsonSerializable()
class Target extends Equatable {
  @JsonKey(name: '@type')
  final String? type;
  final String? urlTemplate;

  const Target({this.type, this.urlTemplate});

  factory Target.fromJson(Map<String, dynamic> json) {
    return _$TargetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TargetToJson(this);

  Target copyWith({
    String? type,
    String? urlTemplate,
  }) {
    return Target(
      type: type ?? this.type,
      urlTemplate: urlTemplate ?? this.urlTemplate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [type, urlTemplate];
}
