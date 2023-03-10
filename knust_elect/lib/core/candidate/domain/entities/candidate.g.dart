// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Candidate _$$_CandidateFromJson(Map<String, dynamic> json) => _$_Candidate(
      id: json['id'] as String,
      name: json['name'] as String,
      position: Polls.fromJson(json['position'] as Map<String, dynamic>),
      votes: json['votes'] as int,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_CandidateToJson(_$_Candidate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'votes': instance.votes,
      'photo': instance.photo,
    };
