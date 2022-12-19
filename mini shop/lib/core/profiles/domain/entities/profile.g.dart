// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      dateJoined: json['dateJoined'] as String,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'email': instance.email,
      'name': instance.name,
      'photo': instance.photo,
      'dateJoined': instance.dateJoined,
    };
