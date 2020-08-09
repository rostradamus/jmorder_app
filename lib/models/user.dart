part 'user.g.dart';

class User {
  int id;
  String email;
  String phone;
  String firstName;
  String lastName;

  String get fullName => "$firstName $lastName";

  User({this.id, this.email, this.phone, this.firstName, this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
