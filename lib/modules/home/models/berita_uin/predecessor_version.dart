import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'predecessor_version.g.dart';

@JsonSerializable()
class PredecessorVersion extends Equatable {
  final int? id;
  final String? href;

  const PredecessorVersion({this.id, this.href});

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) {
    return _$PredecessorVersionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PredecessorVersionToJson(this);

  PredecessorVersion copyWith({
    int? id,
    String? href,
  }) {
    return PredecessorVersion(
      id: id ?? this.id,
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, href];
}
