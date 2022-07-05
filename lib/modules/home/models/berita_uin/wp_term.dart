import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wp_term.g.dart';

@JsonSerializable()
class WpTerm extends Equatable {
  final String? taxonomy;
  final bool? embeddable;
  final String? href;

  const WpTerm({this.taxonomy, this.embeddable, this.href});

  factory WpTerm.fromJson(Map<String, dynamic> json) {
    return _$WpTermFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WpTermToJson(this);

  WpTerm copyWith({
    String? taxonomy,
    bool? embeddable,
    String? href,
  }) {
    return WpTerm(
      taxonomy: taxonomy ?? this.taxonomy,
      embeddable: embeddable ?? this.embeddable,
      href: href ?? this.href,
    );
  }

  @override
  List<Object?> get props => [taxonomy, embeddable, href];
}
