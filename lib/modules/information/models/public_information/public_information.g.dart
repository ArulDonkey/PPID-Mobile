// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicInformation _$PublicInformationFromJson(Map<String, dynamic> json) =>
    PublicInformation(
      idInfoPub: json['id_info_pub'] as String?,
      tipeInfoPub: json['tipe_info_pub'] as String?,
      namaInfoPub: json['nama_info_pub'] as String?,
      linkInfoPub: json['link_info_pub'] as String?,
      subInfoPub: json['sub_info_pub'],
    );

Map<String, dynamic> _$PublicInformationToJson(PublicInformation instance) =>
    <String, dynamic>{
      'id_info_pub': instance.idInfoPub,
      'tipe_info_pub': instance.tipeInfoPub,
      'nama_info_pub': instance.namaInfoPub,
      'link_info_pub': instance.linkInfoPub,
      'sub_info_pub': instance.subInfoPub,
    };
