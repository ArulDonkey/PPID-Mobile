import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sub_info_pub.dart';

part 'public_information.g.dart';

@JsonSerializable()
class PublicInformation extends Equatable {
  @JsonKey(name: 'id_info_pub')
  final String? idInfoPub;
  @JsonKey(name: 'ids_tipe_info_pub')
  final String? idsTipeInfoPub;
  @JsonKey(name: 'nama_info_pub')
  final String? namaInfoPub;
  @JsonKey(name: 'link_info_pub')
  final String? linkInfoPub;
  @JsonKey(name: 'sub_info_pub')
  final dynamic subInfoPub;

  const PublicInformation({
    this.idInfoPub,
    this.idsTipeInfoPub,
    this.namaInfoPub,
    this.linkInfoPub,
    this.subInfoPub,
  });

  factory PublicInformation.fromJson(Map<String, dynamic> json) {
    return _$PublicInformationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PublicInformationToJson(this);

  PublicInformation copyWith({
    String? idInfoPub,
    String? idsTipeInfoPub,
    String? namaInfoPub,
    String? linkInfoPub,
    List<SubInfoPub>? subInfoPub,
  }) {
    return PublicInformation(
      idInfoPub: idInfoPub ?? this.idInfoPub,
      idsTipeInfoPub: idsTipeInfoPub ?? this.idsTipeInfoPub,
      namaInfoPub: namaInfoPub ?? this.namaInfoPub,
      linkInfoPub: linkInfoPub ?? this.linkInfoPub,
      subInfoPub: subInfoPub ?? this.subInfoPub,
    );
  }

  @override
  List<Object?> get props {
    return [
      idInfoPub,
      idsTipeInfoPub,
      namaInfoPub,
      linkInfoPub,
      subInfoPub,
    ];
  }
}
