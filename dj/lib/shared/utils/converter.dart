import 'package:cloud_firestore/cloud_firestore.dart';

/// Handy json converter for external apis
class JsonConverterWrapper {
  /// Get date
  static String date(Map<dynamic, dynamic> json, Object value) {
    return (json['date'] as Timestamp).toDate().toString();
  }

  /// Get date
  static String startDate(Map<dynamic, dynamic> json, Object value) {
    return (json['startDate'] as Timestamp).toDate().toString();
  }

  /// Get date
  static String endDate(Map<dynamic, dynamic> json, Object value) {
    return (json['endDate'] as Timestamp).toDate().toString();
  }

  /// Get date
  static String dateOfBirth(Map<dynamic, dynamic> json, Object value) {
    return (json['dateOfBirth'] as Timestamp).toDate().toString();
  }

  /// Get TimeStamp
  static Timestamp toJson(String value) {
    final date = DateTime.parse(value);
    return Timestamp.fromDate(date);
  }

  /// Convert timer duration
  static String strDigits(int n) => n.toString().padLeft(2, '0');
}
