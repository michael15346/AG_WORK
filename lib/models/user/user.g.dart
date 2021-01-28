// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['_id'] as String,
    role: json['role'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'role': instance.role,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
    };
