import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/student/domain/entities/student.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// Student Entity
  static const student = 0;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<Student>(StudentAdapter());
  }
}
