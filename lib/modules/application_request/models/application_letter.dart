import 'package:equatable/equatable.dart';

class ApplicationLetter extends Equatable {
  final String? idPerInfoPub;
  final String? rincian;
  final String? tujuan;
  final String? pernyataan;
  final String? statusPermohonan;
  final String? jawaban;
  final String? permohonan;
  final String? createdBy;
  final DateTime? dateCreated;
  final String? updatedBy;
  final DateTime? dateUpdated;

  const ApplicationLetter({
    this.idPerInfoPub,
    this.rincian,
    this.tujuan,
    this.pernyataan,
    this.statusPermohonan,
    this.jawaban,
    this.permohonan,
    this.createdBy,
    this.dateCreated,
    this.updatedBy,
    this.dateUpdated,
  });

  factory ApplicationLetter.fromJson(Map<String, dynamic> json) {
    return ApplicationLetter(
      idPerInfoPub: json['id_per_info_pub'] as String?,
      rincian: json['rincian'] as String?,
      tujuan: json['tujuan'] as String?,
      pernyataan: json['pernyataan'] as String?,
      statusPermohonan: json['status_permohonan'] as String?,
      jawaban: json['jawaban'] as String?,
      permohonan: json['permohonan'] as String?,
      createdBy: json['created_by'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      updatedBy: json['updated_by'] as String?,
      dateUpdated: json['date_updated'] == null
          ? null
          : DateTime.parse(json['date_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id_per_info_pub': idPerInfoPub,
        'rincian': rincian,
        'tujuan': tujuan,
        'pernyataan': pernyataan,
        'status_permohonan': statusPermohonan,
        'jawaban': jawaban,
        'permohonan': permohonan,
        'created_by': createdBy,
        'date_created': dateCreated?.toIso8601String(),
        'updated_by': updatedBy,
        'date_updated': dateUpdated?.toIso8601String(),
      };

  ApplicationLetter copyWith({
    String? idPerInfoPub,
    String? rincian,
    String? tujuan,
    String? pernyataan,
    String? statusPermohonan,
    String? jawaban,
    String? permohonan,
    String? createdBy,
    DateTime? dateCreated,
    String? updatedBy,
    DateTime? dateUpdated,
  }) {
    return ApplicationLetter(
      idPerInfoPub: idPerInfoPub ?? this.idPerInfoPub,
      rincian: rincian ?? this.rincian,
      tujuan: tujuan ?? this.tujuan,
      pernyataan: pernyataan ?? this.pernyataan,
      statusPermohonan: statusPermohonan ?? this.statusPermohonan,
      jawaban: jawaban ?? this.jawaban,
      permohonan: permohonan ?? this.permohonan,
      createdBy: createdBy ?? this.createdBy,
      dateCreated: dateCreated ?? this.dateCreated,
      updatedBy: updatedBy ?? this.updatedBy,
      dateUpdated: dateUpdated ?? this.dateUpdated,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      idPerInfoPub,
      rincian,
      tujuan,
      pernyataan,
      statusPermohonan,
      jawaban,
      permohonan,
      createdBy,
      dateCreated,
      updatedBy,
      dateUpdated,
    ];
  }
}
