// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Polls _$$_PollsFromJson(Map<String, dynamic> json) => _$_Polls(
      id: json['id'] as String,
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_PollsToJson(_$_Polls instance) => <String, dynamic>{
      'id': instance.id,
      'candidates': instance.candidates,
      'photo': instance.photo,
    };
