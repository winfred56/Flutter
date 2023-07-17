import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/error/exception.dart';
import '../../domain/entities/user.dart';

/// Access user data stored locally
abstract class UserLocalDatabase {
  /// returns a user model
  Future<User> retrieve();

  /// Saves a user model
  Future<void> save(User user);

  /// Retrieves the user authentication state
  Future<bool> authenticationStatus();


}

/// Implements [UserLocalDatabase]
class UserLocalDatabaseImpl implements UserLocalDatabase {
  /// Constructor
  UserLocalDatabaseImpl(this.hiveInterface);

  /// Hive database instance for storing data
  final HiveInterface hiveInterface;

  /// BoxName for [UserAdapter]
  static const String _boxName = 'profile';

  /// Returns a hive instance of a user model
  Future<User> _retrieveBox() async {
    try {
      final box = await hiveInterface.openBox<User>(_boxName);
      return box.get(0) ?? User.initial();
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveBox();
    }
  }

  @override
  Future<bool> authenticationStatus() async {
    try {
      final user = await _retrieveBox();
      if (kDebugMode) {
        print('${user.id.isNotEmpty}');
      }
      return user.id.isNotEmpty;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<User> retrieve() async {
    try {
      final user = await _retrieveBox();
      return user;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<void> save(User user) async {
    try {
      final box = await hiveInterface.openBox<User>(_boxName);
      await box.put(0, user);
      if (kDebugMode) {
        print('Saving ${user.id} locally');
      }
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

}
