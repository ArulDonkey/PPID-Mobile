// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wp_term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WpTerm _$WpTermFromJson(Map<String, dynamic> json) => WpTerm(
      taxonomy: json['taxonomy'] as String?,
      embeddable: json['embeddable'] as bool?,
      href: json['href'] as String?,
    );

Map<String, dynamic> _$WpTermToJson(WpTerm instance) => <String, dynamic>{
      'taxonomy': instance.taxonomy,
      'embeddable': instance.embeddable,
      'href': instance.href,
    };
