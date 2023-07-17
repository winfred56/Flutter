import 'package:dartz/dartz.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../database/user_local_database.dart';
import '../database/user_remote_database.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDatabase,
      required this.localDatabase});

  /// Dependencies
  NetworkInfo networkInfo;
  UserRemoteDatabase remoteDatabase;
  UserLocalDatabase localDatabase;

  @override
  Future<Either<Failure, User>> update(User user) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.update(user);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> authenticatedUser() async {
    try {
      return Right(await localDatabase.retrieve());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User user) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.createUser(user);
      await localDatabase.save(results);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> logout() async {
    try {
      final result = User.initial();
      await localDatabase.save(result);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> retrieve(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.deleteAccount(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
