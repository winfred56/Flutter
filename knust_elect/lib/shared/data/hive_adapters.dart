import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/electorate/domain/entities/electorate.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// Electorate Entity
  static const electorate = 0;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<Electorate>(ElectorateAdapter());
  }
}
