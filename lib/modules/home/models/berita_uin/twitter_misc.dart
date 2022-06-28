import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'twitter_misc.g.dart';

@JsonSerializable()
class TwitterMisc extends Equatable {
  @JsonKey(name: 'Ditulis oleh')
  final String? ditulisOleh;
  @JsonKey(name: 'Estimasi waktu membaca')
  final String? estimasiWaktuMembaca;

  const TwitterMisc({this.ditulisOleh, this.estimasiWaktuMembaca});

  factory TwitterMisc.fromJson(Map<String, dynamic> json) {
    return _$TwitterMiscFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TwitterMiscToJson(this);

  TwitterMisc copyWith({
    String? ditulisOleh,
    String? estimasiWaktuMembaca,
  }) {
    return TwitterMisc(
      ditulisOleh: ditulisOleh ?? this.ditulisOleh,
      estimasiWaktuMembaca: estimasiWaktuMembaca ?? this.estimasiWaktuMembaca,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [ditulisOleh, estimasiWaktuMembaca];
}
