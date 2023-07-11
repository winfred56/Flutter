/// [Exception] thrown for server related error and device error
class DeviceException implements Exception {
  /// Constructor for exceptions
  DeviceException(this.message, {this.statusCode = 404});

  /// Convert error messages from database
  factory DeviceException.fromJson(Map<String, dynamic> json,
          {int code = 404}) =>
      DeviceException(json['detail'] as String, statusCode: code);

  /// Error message
  final String message;

  /// Error code
  final int statusCode;

  @override
  String toString() => message;
}
