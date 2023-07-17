import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/user/domain/entities/user.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// User Entity
  static const user = 0;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<User>(UserAdapter());
  }
}
