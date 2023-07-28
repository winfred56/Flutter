// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
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
  String get fullName => throw _privateConstructorUsedError;

  /// Profile image associated to the user
  @HiveField(5)
  String get photo => throw _privateConstructorUsedError;

  /// Profile image associated to the user
  @HiveField(6)
  String get fcmToken => throw _privateConstructorUsedError;

  /// User's Date of Birth
  @JsonKey(
      readValue: JsonConverterWrapper.dateOfBirth,
      toJson: JsonConverterWrapper.toJson)
  @HiveField(7)
  String get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String username,
      @HiveField(3) String email,
      @HiveField(4) String fullName,
      @HiveField(5) String photo,
      @HiveField(6) String fcmToken,
      @JsonKey(
          readValue: JsonConverterWrapper.dateOfBirth,
          toJson: JsonConverterWrapper.toJson)
      @HiveField(7)
      String dateOfBirth});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? fullName = null,
    Object? photo = null,
    Object? fcmToken = null,
    Object? dateOfBirth = null,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String phoneNumber,
      @HiveField(2) String username,
      @HiveField(3) String email,
      @HiveField(4) String fullName,
      @HiveField(5) String photo,
      @HiveField(6) String fcmToken,
      @JsonKey(
          readValue: JsonConverterWrapper.dateOfBirth,
          toJson: JsonConverterWrapper.toJson)
      @HiveField(7)
      String dateOfBirth});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = null,
    Object? photo = null,
    Object? fcmToken = null,
    Object? dateOfBirth = null,
  }) {
    return _then(_$_User(
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.phoneNumber,
      @HiveField(2) required this.username,
      @HiveField(3) required this.email,
      @HiveField(4) required this.fullName,
      @HiveField(5) required this.photo,
      @HiveField(6) required this.fcmToken,
      @JsonKey(
          readValue: JsonConverterWrapper.dateOfBirth,
          toJson: JsonConverterWrapper.toJson)
      @HiveField(7)
      required this.dateOfBirth})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

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
  final String fullName;

  /// Profile image associated to the user
  @override
  @HiveField(5)
  final String photo;

  /// Profile image associated to the user
  @override
  @HiveField(6)
  final String fcmToken;

  /// User's Date of Birth
  @override
  @JsonKey(
      readValue: JsonConverterWrapper.dateOfBirth,
      toJson: JsonConverterWrapper.toJson)
  @HiveField(7)
  final String dateOfBirth;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, username, email,
      fullName, photo, fcmToken, dateOfBirth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String phoneNumber,
      @HiveField(2) required final String username,
      @HiveField(3) required final String email,
      @HiveField(4) required final String fullName,
      @HiveField(5) required final String photo,
      @HiveField(6) required final String fcmToken,
      @JsonKey(
          readValue: JsonConverterWrapper.dateOfBirth,
          toJson: JsonConverterWrapper.toJson)
      @HiveField(7)
      required final String dateOfBirth}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  String get fullName;
  @override

  /// Profile image associated to the user
  @HiveField(5)
  String get photo;
  @override

  /// Profile image associated to the user
  @HiveField(6)
  String get fcmToken;
  @override

  /// User's Date of Birth
  @JsonKey(
      readValue: JsonConverterWrapper.dateOfBirth,
      toJson: JsonConverterWrapper.toJson)
  @HiveField(7)
  String get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
