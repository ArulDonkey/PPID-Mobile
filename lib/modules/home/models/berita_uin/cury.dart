import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cury.g.dart';

@JsonSerializable()
class Cury extends Equatable {
  final String? name;
  final String? href;
  final bool? templated;

  const Cury({this.name, this.href, this.templated});

  factory Cury.fromJson(Map<String, dynamic> json) => _$CuryFromJson(json);

  Map<String, dynamic> toJson() => _$CuryToJson(this);

  Cury copyWith({
    String? name,
    String? href,
    bool? templated,
  }) {
    return Cury(
      name: name ?? this.name,
      href: href ?? this.href,
      templated: templated ?? this.templated,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, href, templated];
}
