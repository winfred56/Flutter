// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Candidate _$CandidateFromJson(Map<String, dynamic> json) {
  return _Candidate.fromJson(json);
}

/// @nodoc
mixin _$Candidate {
  ///  Firebase documentID -> [id]
  String get id => throw _privateConstructorUsedError;

  /// Full name associated to the [Candidate]
  String get name => throw _privateConstructorUsedError;

  /// Aspiring Poll of the [Candidate]
  Polls get position => throw _privateConstructorUsedError;

  /// Full name associated to the [Candidate]
  int get votes => throw _privateConstructorUsedError;

  /// Profile image associated to the [Candidate]
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateCopyWith<Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateCopyWith<$Res> {
  factory $CandidateCopyWith(Candidate value, $Res Function(Candidate) then) =
      _$CandidateCopyWithImpl<$Res, Candidate>;
  @useResult
  $Res call({String id, String name, Polls position, int votes, String photo});

  $PollsCopyWith<$Res> get position;
}

/// @nodoc
class _$CandidateCopyWithImpl<$Res, $Val extends Candidate>
    implements $CandidateCopyWith<$Res> {
  _$CandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = null,
    Object? votes = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Polls,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PollsCopyWith<$Res> get position {
    return $PollsCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CandidateCopyWith<$Res> implements $CandidateCopyWith<$Res> {
  factory _$$_CandidateCopyWith(
          _$_Candidate value, $Res Function(_$_Candidate) then) =
      __$$_CandidateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, Polls position, int votes, String photo});

  @override
  $PollsCopyWith<$Res> get position;
}

/// @nodoc
class __$$_CandidateCopyWithImpl<$Res>
    extends _$CandidateCopyWithImpl<$Res, _$_Candidate>
    implements _$$_CandidateCopyWith<$Res> {
  __$$_CandidateCopyWithImpl(
      _$_Candidate _value, $Res Function(_$_Candidate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = null,
    Object? votes = null,
    Object? photo = null,
  }) {
    return _then(_$_Candidate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Polls,
      votes: null == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as int,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Candidate extends _Candidate {
  _$_Candidate(
      {required this.id,
      required this.name,
      required this.position,
      required this.votes,
      required this.photo})
      : super._();

  factory _$_Candidate.fromJson(Map<String, dynamic> json) =>
      _$$_CandidateFromJson(json);

  ///  Firebase documentID -> [id]
  @override
  final String id;

  /// Full name associated to the [Candidate]
  @override
  final String name;

  /// Aspiring Poll of the [Candidate]
  @override
  final Polls position;

  /// Full name associated to the [Candidate]
  @override
  final int votes;

  /// Profile image associated to the [Candidate]
  @override
  final String photo;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Candidate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.votes, votes) || other.votes == votes) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, position, votes, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CandidateCopyWith<_$_Candidate> get copyWith =>
      __$$_CandidateCopyWithImpl<_$_Candidate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CandidateToJson(
      this,
    );
  }
}

abstract class _Candidate extends Candidate {
  factory _Candidate(
      {required final String id,
      required final String name,
      required final Polls position,
      required final int votes,
      required final String photo}) = _$_Candidate;
  _Candidate._() : super._();

  factory _Candidate.fromJson(Map<String, dynamic> json) =
      _$_Candidate.fromJson;

  @override

  ///  Firebase documentID -> [id]
  String get id;
  @override

  /// Full name associated to the [Candidate]
  String get name;
  @override

  /// Aspiring Poll of the [Candidate]
  Polls get position;
  @override

  /// Full name associated to the [Candidate]
  int get votes;
  @override

  /// Profile image associated to the [Candidate]
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_CandidateCopyWith<_$_Candidate> get copyWith =>
      throw _privateConstructorUsedError;
}
