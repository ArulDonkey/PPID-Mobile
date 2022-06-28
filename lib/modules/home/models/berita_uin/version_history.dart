import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_history.g.dart';

@JsonSerializable()
class VersionHistory extends Equatable {
  final int? count;
  final String? href;

  const VersionHistory({this.count, this.href});

  factory VersionHistory.fromJson(Map<String, dynamic> json) {
    return _$VersionHistoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionHistoryToJson(this);

  VersionHistory copyWith({
    int? count,
    String? href,
  }) {
    return VersionHistory(
      count: count ?? this.count,
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [count, href];
}
