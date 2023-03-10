// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Polls _$PollsFromJson(Map<String, dynamic> json) {
  return _Polls.fromJson(json);
}

/// @nodoc
mixin _$Polls {
  ///  Firebase documentID -> [id]
  String get id => throw _privateConstructorUsedError;

  /// List of aspiring candidates of the associated [Polls]
  List<Candidate> get candidates => throw _privateConstructorUsedError;

  /// Profile image associated to the [Polls]
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PollsCopyWith<Polls> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollsCopyWith<$Res> {
  factory $PollsCopyWith(Polls value, $Res Function(Polls) then) =
      _$PollsCopyWithImpl<$Res, Polls>;
  @useResult
  $Res call({String id, List<Candidate> candidates, String photo});
}

/// @nodoc
class _$PollsCopyWithImpl<$Res, $Val extends Polls>
    implements $PollsCopyWith<$Res> {
  _$PollsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? candidates = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PollsCopyWith<$Res> implements $PollsCopyWith<$Res> {
  factory _$$_PollsCopyWith(_$_Polls value, $Res Function(_$_Polls) then) =
      __$$_PollsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<Candidate> candidates, String photo});
}

/// @nodoc
class __$$_PollsCopyWithImpl<$Res> extends _$PollsCopyWithImpl<$Res, _$_Polls>
    implements _$$_PollsCopyWith<$Res> {
  __$$_PollsCopyWithImpl(_$_Polls _value, $Res Function(_$_Polls) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? candidates = null,
    Object? photo = null,
  }) {
    return _then(_$_Polls(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Polls extends _Polls {
  _$_Polls(
      {required this.id,
      required final List<Candidate> candidates,
      required this.photo})
      : _candidates = candidates,
        super._();

  factory _$_Polls.fromJson(Map<String, dynamic> json) =>
      _$$_PollsFromJson(json);

  ///  Firebase documentID -> [id]
  @override
  final String id;

  /// List of aspiring candidates of the associated [Polls]
  final List<Candidate> _candidates;

  /// List of aspiring candidates of the associated [Polls]
  @override
  List<Candidate> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  /// Profile image associated to the [Polls]
  @override
  final String photo;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Polls &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_candidates), photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PollsCopyWith<_$_Polls> get copyWith =>
      __$$_PollsCopyWithImpl<_$_Polls>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PollsToJson(
      this,
    );
  }
}

abstract class _Polls extends Polls {
  factory _Polls(
      {required final String id,
      required final List<Candidate> candidates,
      required final String photo}) = _$_Polls;
  _Polls._() : super._();

  factory _Polls.fromJson(Map<String, dynamic> json) = _$_Polls.fromJson;

  @override

  ///  Firebase documentID -> [id]
  String get id;
  @override

  /// List of aspiring candidates of the associated [Polls]
  List<Candidate> get candidates;
  @override

  /// Profile image associated to the [Polls]
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_PollsCopyWith<_$_Polls> get copyWith =>
      throw _privateConstructorUsedError;
}
