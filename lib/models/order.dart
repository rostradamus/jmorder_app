import 'package:jmorder_app/models/client.dart';
import 'package:jmorder_app/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order {
  int id;
  User user;
  Client client;
  DateTime createdAt;
  DateTime updatedAt;

  Order({this.id, this.user, this.client, this.createdAt, this.updatedAt});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
