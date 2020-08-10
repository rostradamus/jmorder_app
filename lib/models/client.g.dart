part of 'client.dart';

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    id: json['id'] as int,
    name: json['name'] as String,
    phone: json['phone'] as String,
    createdAt: json['createdAt'] as DateTime,
    updatedAt: json['updatedAt'] as DateTime,
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
