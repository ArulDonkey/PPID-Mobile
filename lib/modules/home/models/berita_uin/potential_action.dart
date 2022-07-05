import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'target.dart';

part 'potential_action.g.dart';

@JsonSerializable()
class PotentialAction extends Equatable {
  @JsonKey(name: '@type')
  final String? type;
  final Target? target;
  @JsonKey(name: 'query-input')
  final String? queryInput;

  const PotentialAction({this.type, this.target, this.queryInput});

  factory PotentialAction.fromJson(Map<String, dynamic> json) {
    return _$PotentialActionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PotentialActionToJson(this);

  PotentialAction copyWith({
    String? type,
    Target? target,
    String? queryInput,
  }) {
    return PotentialAction(
      type: type ?? this.type,
      target: target ?? this.target,
      queryInput: queryInput ?? this.queryInput,
    );
  }

  @override
  List<Object?> get props => [type, target, queryInput];
}
