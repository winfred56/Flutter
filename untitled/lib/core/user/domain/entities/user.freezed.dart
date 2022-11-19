// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return _CustomUser.fromJson(json);
}

/// @nodoc
mixin _$CustomUser {
  /// User's preferred username
  String get username => throw _privateConstructorUsedError;

  /// User's Full Name
  String get fullName => throw _privateConstructorUsedError;

  /// Gender of the user
  String get gender => throw _privateConstructorUsedError;

  /// User's email address
  String get email => throw _privateConstructorUsedError;

  /// User's profile photo
  String get profilePicture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomUserCopyWith<CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomUserCopyWith<$Res> {
  factory $CustomUserCopyWith(
          CustomUser value, $Res Function(CustomUser) then) =
      _$CustomUserCopyWithImpl<$Res, CustomUser>;
  @useResult
  $Res call(
      {String username,
      String fullName,
      String gender,
      String email,
      String profilePicture});
}

/// @nodoc
class _$CustomUserCopyWithImpl<$Res, $Val extends CustomUser>
    implements $CustomUserCopyWith<$Res> {
  _$CustomUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? fullName = null,
    Object? gender = null,
    Object? email = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomUserCopyWith<$Res>
    implements $CustomUserCopyWith<$Res> {
  factory _$$_CustomUserCopyWith(
          _$_CustomUser value, $Res Function(_$_CustomUser) then) =
      __$$_CustomUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String fullName,
      String gender,
      String email,
      String profilePicture});
}

/// @nodoc
class __$$_CustomUserCopyWithImpl<$Res>
    extends _$CustomUserCopyWithImpl<$Res, _$_CustomUser>
    implements _$$_CustomUserCopyWith<$Res> {
  __$$_CustomUserCopyWithImpl(
      _$_CustomUser _value, $Res Function(_$_CustomUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? fullName = null,
    Object? gender = null,
    Object? email = null,
    Object? profilePicture = null,
  }) {
    return _then(_$_CustomUser(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomUser implements _CustomUser {
  _$_CustomUser(
      {required this.username,
      required this.fullName,
      required this.gender,
      required this.email,
      required this.profilePicture});

  factory _$_CustomUser.fromJson(Map<String, dynamic> json) =>
      _$$_CustomUserFromJson(json);

  /// User's preferred username
  @override
  final String username;

  /// User's Full Name
  @override
  final String fullName;

  /// Gender of the user
  @override
  final String gender;

  /// User's email address
  @override
  final String email;

  /// User's profile photo
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'CustomUser(username: $username, fullName: $fullName, gender: $gender, email: $email, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomUser &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, fullName, gender, email, profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomUserCopyWith<_$_CustomUser> get copyWith =>
      __$$_CustomUserCopyWithImpl<_$_CustomUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomUserToJson(
      this,
    );
  }
}

abstract class _CustomUser implements CustomUser {
  factory _CustomUser(
      {required final String username,
      required final String fullName,
      required final String gender,
      required final String email,
      required final String profilePicture}) = _$_CustomUser;

  factory _CustomUser.fromJson(Map<String, dynamic> json) =
      _$_CustomUser.fromJson;

  @override

  /// User's preferred username
  String get username;
  @override

  /// User's Full Name
  String get fullName;
  @override

  /// Gender of the user
  String get gender;
  @override

  /// User's email address
  String get email;
  @override

  /// User's profile photo
  String get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$_CustomUserCopyWith<_$_CustomUser> get copyWith =>
      throw _privateConstructorUsedError;
}
