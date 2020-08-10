part 'client.g.dart';

class Client {
  int id;
  String name;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  Client({this.id, this.name, this.phone, this.createdAt, this.updatedAt});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
