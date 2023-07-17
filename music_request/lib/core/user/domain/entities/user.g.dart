// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      phoneNumber: fields[1] as String,
      username: fields[2] as String,
      email: fields[3] as String,
      fullName: fields[4] as String,
      photo: fields[5] as String,
      fcmToken: fields[6] as String,
      dateOfBirth: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.photo)
      ..writeByte(6)
      ..write(obj.fcmToken)
      ..writeByte(7)
      ..write(obj.dateOfBirth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      photo: json['photo'] as String,
      fcmToken: json['fcmToken'] as String,
      dateOfBirth:
          JsonConverterWrapper.dateOfBirth(json, 'dateOfBirth') as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'email': instance.email,
      'fullName': instance.fullName,
      'photo': instance.photo,
      'fcmToken': instance.fcmToken,
      'dateOfBirth': JsonConverterWrapper.toJson(instance.dateOfBirth),
    };
