import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Format Date standard
class DateFormatter {
  /// Formats date into year,month,day and time eg: September 4, 2021 11:00 am
  static String toDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.yMMMMd();
    return '${formatter.format(parsedDate)} '
        '${DateFormat.jm().format(parsedDate)}';
  }

  /// Formats date into year,month,day and time eg: September 4, 2021 11:00 am
  static String shortDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.yMMMd();
    return formatter.format(parsedDate);
  }

  static String birthDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat('MMMM d');
    return formatter.format(parsedDate);
  }


  static DateTime convertToDateTime(String date) {
    final formatter = DateFormat.yMMMd();
    final parsedDate = formatter.parse(date);
    return parsedDate;
  }


  /// Formats time into minutes ago  15m ago
  static String timeParsed(String date) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(date));
    if (difference.inDays > 1) {
      return shortDate(date);
    }
    final time = now.subtract(difference);
    return timeago.format(time);
  }
}
