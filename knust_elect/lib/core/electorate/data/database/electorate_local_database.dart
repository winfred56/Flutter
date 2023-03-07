import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/error/exception.dart';
import '../../domain/entities/electorate.dart';

/// Access electorate data stored locally
abstract class ElectorateLocalDatabase {
  /// returns a electorate model
  Future<Electorate> retrieve();

  /// Saves a electorate model
  Future<void> save(Electorate electorate);

  /// Retrieves the electorate authentication state
  Future<bool> authenticationStatus();


}

/// Implements [ElectorateLocalDatabase]
class ElectorateLocalDatabaseImpl implements ElectorateLocalDatabase {
  /// Constructor
  ElectorateLocalDatabaseImpl(this.hiveInterface);

  /// Hive database instance for storing data
  final HiveInterface hiveInterface;

  /// BoxName for [ElectorateAdapter]
  static const String _boxName = 'profile';

  /// Returns a hive instance of a electorate model
  Future<Electorate> _retrieveBox() async {
    try {
      final box = await hiveInterface.openBox<Electorate>(_boxName);
      return box.get(0) ?? Electorate.initial();
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveBox();
    }
  }

  @override
  Future<bool> authenticationStatus() async {
    try {
      final electorate = await _retrieveBox();
      if (kDebugMode) {
        print('${electorate.id.isNotEmpty}');
      }
      return electorate.id.isNotEmpty;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<Electorate> retrieve() async {
    try {
      final electorate = await _retrieveBox();
      return electorate;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<void> save(Electorate electorate) async {
    try {
      final box = await hiveInterface.openBox<Electorate>(_boxName);
      await box.put(0, electorate);
      if (kDebugMode) {
        print('Saving ${electorate.id} locally');
      }
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

}
