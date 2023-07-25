// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      id: json['id'] as String,
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      dj: User.fromJson(json['dj'] as Map<String, dynamic>),
      date: JsonConverterWrapper.date(json, 'date') as String,
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'id': instance.id,
      'song': instance.song.toJson(),
      'user': instance.user.toJson(),
      'dj': instance.dj.toJson(),
      'date': JsonConverterWrapper.toJson(instance.date),
    };
