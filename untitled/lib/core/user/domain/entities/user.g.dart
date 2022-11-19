// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.username,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
    };
