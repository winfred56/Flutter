// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electorate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElectorateAdapter extends TypeAdapter<Electorate> {
  @override
  final int typeId = 0;

  @override
  Electorate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Electorate(
      id: fields[0] as String,
      phoneNumber: fields[1] as String,
      username: fields[2] as String,
      email: fields[3] as String,
      name: fields[4] as String,
      photo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Electorate obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElectorateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Electorate _$$_ElectorateFromJson(Map<String, dynamic> json) =>
    _$_Electorate(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_ElectorateToJson(_$_Electorate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'email': instance.email,
      'name': instance.name,
      'photo': instance.photo,
    };
