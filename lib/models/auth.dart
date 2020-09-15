import 'package:json_annotation/json_annotation.dart';
import 'package:jmorder_app/models/user.dart';

part 'auth.g.dart';

@JsonSerializable(explicitToJson: true)
class Auth {
  String token;
  String type;
  String email;
  int id;
  User user;

  Auth({this.token, this.type, this.email, this.id, this.user});

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
