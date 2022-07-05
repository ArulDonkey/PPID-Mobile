import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_list_element.g.dart';

@JsonSerializable()
class ItemListElement extends Equatable {
  @JsonKey(name: '@type')
  final String? type;
  final int? position;
  final String? name;
  final String? item;

  const ItemListElement({this.type, this.position, this.name, this.item});

  factory ItemListElement.fromJson(Map<String, dynamic> json) {
    return _$ItemListElementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemListElementToJson(this);

  ItemListElement copyWith({
    String? type,
    int? position,
    String? name,
    String? item,
  }) {
    return ItemListElement(
      type: type ?? this.type,
      position: position ?? this.position,
      name: name ?? this.name,
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [type, position, name, item];
}
