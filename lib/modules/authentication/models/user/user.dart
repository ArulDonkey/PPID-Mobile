import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String? username;
  final String? nama;
  final String? level;
  final String? keterangan;
  final String? token;

  const User({
    this.username,
    this.nama,
    this.level,
    this.keterangan,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? username,
    String? nama,
    String? level,
    String? keterangan,
    String? token,
  }) {
    return User(
      username: username ?? this.username,
      nama: nama ?? this.nama,
      level: level ?? this.level,
      keterangan: keterangan ?? this.keterangan,
      token: token ?? this.token,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [username, nama, level, keterangan, token];
}
