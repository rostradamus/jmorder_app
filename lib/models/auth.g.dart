part of 'auth.dart';

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    token: json['token'] as String,
    type: json['type'] as String,
    email: json['email'] as String,
    id: json['id'] as int,
    user: User.fromJson(json['user']),
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
      'email': instance.email,
      'id': instance.id,
      'user': instance.user.toJson(),
    };
