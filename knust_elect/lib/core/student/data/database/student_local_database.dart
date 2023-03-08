import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/error/exception.dart';
import '../../domain/entities/student.dart';

/// Access student data stored locally
abstract class StudentLocalDatabase {
  /// returns a student model
  Future<Student> retrieve();

  /// Saves a student model
  Future<void> save(Student student);

  /// Retrieves the student authentication state
  Future<bool> authenticationStatus();


}

/// Implements [StudentLocalDatabase]
class StudentLocalDatabaseImpl implements StudentLocalDatabase {
  /// Constructor
  StudentLocalDatabaseImpl(this.hiveInterface);

  /// Hive database instance for storing data
  final HiveInterface hiveInterface;

  /// BoxName for [StudentAdapter]
  static const String _boxName = 'profile';

  /// Returns a hive instance of a student model
  Future<Student> _retrieveBox() async {
    try {
      final box = await hiveInterface.openBox<Student>(_boxName);
      return box.get(0) ?? Student.initial();
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveBox();
    }
  }

  @override
  Future<bool> authenticationStatus() async {
    try {
      final student = await _retrieveBox();
      if (kDebugMode) {
        print('${student.id.isNotEmpty}');
      }
      return student.id.isNotEmpty;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<Student> retrieve() async {
    try {
      final student = await _retrieveBox();
      return student;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<void> save(Student student) async {
    try {
      final box = await hiveInterface.openBox<Student>(_boxName);
      await box.put(0, student);
      if (kDebugMode) {
        print('Saving ${student.id} locally');
      }
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

}
