// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemListElement _$ItemListElementFromJson(Map<String, dynamic> json) =>
    ItemListElement(
      type: json['@type'] as String?,
      position: json['position'] as int?,
      name: json['name'] as String?,
      item: json['item'] as String?,
    );

Map<String, dynamic> _$ItemListElementToJson(ItemListElement instance) =>
    <String, dynamic>{
      '@type': instance.type,
      'position': instance.position,
      'name': instance.name,
      'item': instance.item,
    };
