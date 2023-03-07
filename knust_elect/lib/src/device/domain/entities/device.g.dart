// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$$_DeviceFromJson(Map<String, dynamic> json) => _$_Device(
      operatingSystemVersion: json['operatingSystemVersion'] as String,
      fcmToken: json['fcmToken'] as String,
      localName: json['localName'] as String,
      operatingSystem: json['operatingSystem'] as String,
      localHostName: json['localHostName'] as String,
    );

Map<String, dynamic> _$$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'operatingSystemVersion': instance.operatingSystemVersion,
      'fcmToken': instance.fcmToken,
      'localName': instance.localName,
      'operatingSystem': instance.operatingSystem,
      'localHostName': instance.localHostName,
    };
