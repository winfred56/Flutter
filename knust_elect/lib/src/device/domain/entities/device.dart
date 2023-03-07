import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

part 'device.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
/// Mobile Device Entity
@freezed
class Device with _$Device {
  /// Constructor
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Device(
      {
      /// Device OS version
      required String operatingSystemVersion,

      /// Unique firebase cloud messaging token
      required String fcmToken,

      /// Local name
      required String localName,

      /// Device OS android/ios

      required String operatingSystem,

      /// Local host name
      required String localHostName}) = _Device;

  /// Convert from json to model
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  /// String representation
  @override
  String toString() => fcmToken;

  /// Initial User dummy data
  factory Device.initial() => const Device(
      operatingSystemVersion: '',
      fcmToken: '',
      localName: '',
      operatingSystem: '',
      localHostName: '');
}
