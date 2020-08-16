import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(includeIfNull: false)
class Item {
  int id;
  String name;
  String unitName;
  String quantityName;
  String comment;

  Item({
    this.id,
    this.name,
    this.unitName,
    this.quantityName,
    this.comment,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
