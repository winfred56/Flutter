// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electorate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Electorate _$ElectorateFromJson(Map<String, dynamic> json) {
  return _Electorate.fromJson(json);
}

/// @nodoc
mixin _$Electorate {
  ///  Firebase documentID -> [id]
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;

  /// Phone number for signIn
  @HiveField(1)
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Firebase user.displayName -> Username
  @HiveField(2)
  String get username => throw _privateConstructorUsedError;

  /// Email associated to the user
  @HiveField(3)
  String get email => throw _privateConstructorUsedError;

  /// Full name associated to the user
  @HiveField(4)
  String get name => throw _privateConstructorUsedError;

  /// Profile image associated to the user
  @HiveField(5)
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectorateCopyWith<Electorate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectorateCopyWith<$Res> {
  factory $ElectorateCopyWith(
          Electorate value, $Res Function(Electorate) then) =
      _$ElectorateCopyWithImpl<$Res, Electorate>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String username,
      @HiveField(3) String email,
      @HiveField(4) String name,
      @HiveField(5) String photo});
}

/// @nodoc
class _$ElectorateCopyWithImpl<$Res, $Val extends Electorate>
    implements $ElectorateCopyWith<$Res> {
  _$ElectorateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? username = null,
    Object? email = null,
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElectorateCopyWith<$Res>
    implements $ElectorateCopyWith<$Res> {
  factory _$$_ElectorateCopyWith(
          _$_Electorate value, $Res Function(_$_Electorate) then) =
      __$$_ElectorateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String username,
      @HiveField(3) String email,
      @HiveField(4) String name,
      @HiveField(5) String photo});
}

/// @nodoc
class __$$_ElectorateCopyWithImpl<$Res>
    extends _$ElectorateCopyWithImpl<$Res, _$_Electorate>
    implements _$$_ElectorateCopyWith<$Res> {
  __$$_ElectorateCopyWithImpl(
      _$_Electorate _value, $Res Function(_$_Electorate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? username = null,
    Object? email = null,
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_$_Electorate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Electorate extends _Electorate {
  _$_Electorate(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.phoneNumber,
      @HiveField(2) required this.username,
      @HiveField(3) required this.email,
      @HiveField(4) required this.name,
      @HiveField(5) required this.photo})
      : super._();

  factory _$_Electorate.fromJson(Map<String, dynamic> json) =>
      _$$_ElectorateFromJson(json);

  ///  Firebase documentID -> [id]
  @override
  @HiveField(0)
  final String id;

  /// Phone number for signIn
  @override
  @HiveField(1)
  final String phoneNumber;

  /// Firebase user.displayName -> Username
  @override
  @HiveField(2)
  final String username;

  /// Email associated to the user
  @override
  @HiveField(3)
  final String email;

  /// Full name associated to the user
  @override
  @HiveField(4)
  final String name;

  /// Profile image associated to the user
  @override
  @HiveField(5)
  final String photo;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Electorate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, phoneNumber, username, email, name, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElectorateCopyWith<_$_Electorate> get copyWith =>
      __$$_ElectorateCopyWithImpl<_$_Electorate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElectorateToJson(
      this,
    );
  }
}

abstract class _Electorate extends Electorate {
  factory _Electorate(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String phoneNumber,
      @HiveField(2) required final String username,
      @HiveField(3) required final String email,
      @HiveField(4) required final String name,
      @HiveField(5) required final String photo}) = _$_Electorate;
  _Electorate._() : super._();

  factory _Electorate.fromJson(Map<String, dynamic> json) =
      _$_Electorate.fromJson;

  @override

  ///  Firebase documentID -> [id]
  @HiveField(0)
  String get id;
  @override

  /// Phone number for signIn
  @HiveField(1)
  String get phoneNumber;
  @override

  /// Firebase user.displayName -> Username
  @HiveField(2)
  String get username;
  @override

  /// Email associated to the user
  @HiveField(3)
  String get email;
  @override

  /// Full name associated to the user
  @HiveField(4)
  String get name;
  @override

  /// Profile image associated to the user
  @HiveField(5)
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_ElectorateCopyWith<_$_Electorate> get copyWith =>
      throw _privateConstructorUsedError;
}
