import 'package:dartz/dartz.dart';
import 'package:knust_elect/core/student/domain/entities/student.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/student_repository.dart';
import '../database/student_local_database.dart';
import '../database/student_remote_database.dart';

class StudentRepositoryImpl implements StudentRepository {
  /// Constructor
  StudentRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDatabase,
      required this.localDatabase});

  /// Dependencies
  NetworkInfo networkInfo;
  StudentRemoteDatabase remoteDatabase;
  StudentLocalDatabase localDatabase;

  @override
  Future<Either<Failure, Student>> update(Student student) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.update(student);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Student>> authenticated() async {
    try {
      return Right(await localDatabase.retrieve());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Student>> signIn(Student student) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.signIn(student);
      await localDatabase.save(results);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Student>> logout() async {
    try {
      final result = Student.initial();
      await localDatabase.save(result);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail() async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.verifyEmail();
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

}
