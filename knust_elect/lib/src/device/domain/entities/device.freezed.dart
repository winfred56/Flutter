// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  /// Device OS version
  String get operatingSystemVersion => throw _privateConstructorUsedError;

  /// Unique firebase cloud messaging token
  String get fcmToken => throw _privateConstructorUsedError;

  /// Local name
  String get localName => throw _privateConstructorUsedError;

  /// Device OS android/ios
  String get operatingSystem => throw _privateConstructorUsedError;

  /// Local host name
  String get localHostName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {String operatingSystemVersion,
      String fcmToken,
      String localName,
      String operatingSystem,
      String localHostName});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatingSystemVersion = null,
    Object? fcmToken = null,
    Object? localName = null,
    Object? operatingSystem = null,
    Object? localHostName = null,
  }) {
    return _then(_value.copyWith(
      operatingSystemVersion: null == operatingSystemVersion
          ? _value.operatingSystemVersion
          : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      operatingSystem: null == operatingSystem
          ? _value.operatingSystem
          : operatingSystem // ignore: cast_nullable_to_non_nullable
              as String,
      localHostName: null == localHostName
          ? _value.localHostName
          : localHostName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$_DeviceCopyWith(_$_Device value, $Res Function(_$_Device) then) =
      __$$_DeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operatingSystemVersion,
      String fcmToken,
      String localName,
      String operatingSystem,
      String localHostName});
}

/// @nodoc
class __$$_DeviceCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$_Device>
    implements _$$_DeviceCopyWith<$Res> {
  __$$_DeviceCopyWithImpl(_$_Device _value, $Res Function(_$_Device) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operatingSystemVersion = null,
    Object? fcmToken = null,
    Object? localName = null,
    Object? operatingSystem = null,
    Object? localHostName = null,
  }) {
    return _then(_$_Device(
      operatingSystemVersion: null == operatingSystemVersion
          ? _value.operatingSystemVersion
          : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      operatingSystem: null == operatingSystem
          ? _value.operatingSystem
          : operatingSystem // ignore: cast_nullable_to_non_nullable
              as String,
      localHostName: null == localHostName
          ? _value.localHostName
          : localHostName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Device implements _Device {
  const _$_Device(
      {required this.operatingSystemVersion,
      required this.fcmToken,
      required this.localName,
      required this.operatingSystem,
      required this.localHostName});

  factory _$_Device.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceFromJson(json);

  /// Device OS version
  @override
  final String operatingSystemVersion;

  /// Unique firebase cloud messaging token
  @override
  final String fcmToken;

  /// Local name
  @override
  final String localName;

  /// Device OS android/ios
  @override
  final String operatingSystem;

  /// Local host name
  @override
  final String localHostName;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Device &&
            (identical(other.operatingSystemVersion, operatingSystemVersion) ||
                other.operatingSystemVersion == operatingSystemVersion) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.operatingSystem, operatingSystem) ||
                other.operatingSystem == operatingSystem) &&
            (identical(other.localHostName, localHostName) ||
                other.localHostName == localHostName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, operatingSystemVersion, fcmToken,
      localName, operatingSystem, localHostName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      __$$_DeviceCopyWithImpl<_$_Device>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {required final String operatingSystemVersion,
      required final String fcmToken,
      required final String localName,
      required final String operatingSystem,
      required final String localHostName}) = _$_Device;

  factory _Device.fromJson(Map<String, dynamic> json) = _$_Device.fromJson;

  @override

  /// Device OS version
  String get operatingSystemVersion;
  @override

  /// Unique firebase cloud messaging token
  String get fcmToken;
  @override

  /// Local name
  String get localName;
  @override

  /// Device OS android/ios
  String get operatingSystem;
  @override

  /// Local host name
  String get localHostName;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      throw _privateConstructorUsedError;
}
