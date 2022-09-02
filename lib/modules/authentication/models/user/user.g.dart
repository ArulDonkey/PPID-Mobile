// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      nama: json['nama'] as String?,
      level: json['level'] as String?,
      keterangan: json['keterangan'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'nama': instance.nama,
      'level': instance.level,
      'keterangan': instance.keterangan,
      'token': instance.token,
    };
