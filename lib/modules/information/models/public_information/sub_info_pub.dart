import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_info_pub.g.dart';

@JsonSerializable()
class SubInfoPub extends Equatable {
  @JsonKey(name: 'id_sub_info_pub')
  final String? idSubInfoPub;
  @JsonKey(name: 'id_info_pub')
  final String? idInfoPub;
  @JsonKey(name: 'nama_sub_info_pub')
  final String? namaSubInfoPub;
  @JsonKey(name: 'link_sub_info_pub')
  final String? linkSubInfoPub;

  const SubInfoPub({
    this.idSubInfoPub,
    this.idInfoPub,
    this.namaSubInfoPub,
    this.linkSubInfoPub,
  });

  factory SubInfoPub.fromJson(Map<String, dynamic> json) {
    return _$SubInfoPubFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubInfoPubToJson(this);

  SubInfoPub copyWith({
    String? idSubInfoPub,
    String? idInfoPub,
    String? namaSubInfoPub,
    String? linkSubInfoPub,
  }) {
    return SubInfoPub(
      idSubInfoPub: idSubInfoPub ?? this.idSubInfoPub,
      idInfoPub: idInfoPub ?? this.idInfoPub,
      namaSubInfoPub: namaSubInfoPub ?? this.namaSubInfoPub,
      linkSubInfoPub: linkSubInfoPub ?? this.linkSubInfoPub,
    );
  }

  @override
  List<Object?> get props {
    return [
      idSubInfoPub,
      idInfoPub,
      namaSubInfoPub,
      linkSubInfoPub,
    ];
  }
}
