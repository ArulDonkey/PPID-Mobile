import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'graph.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema extends Equatable {
  @JsonKey(name: '@context')
  final String? context;
  @JsonKey(name: '@graph')
  final List<Graph>? graph;

  const Schema({this.context, this.graph});

  factory Schema.fromJson(Map<String, dynamic> json) {
    return _$SchemaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchemaToJson(this);

  Schema copyWith({
    String? context,
    List<Graph>? graph,
  }) {
    return Schema(
      context: context ?? this.context,
      graph: graph ?? this.graph,
    );
  }

  @override
  List<Object?> get props => [context, graph];
}
