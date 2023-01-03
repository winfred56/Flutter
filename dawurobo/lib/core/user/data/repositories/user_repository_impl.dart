import 'package:dartz/dartz.dart';
import 'package:dawurobo/core/user/data/data_sources/local_database.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_database.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
    required this.localDatabase
  });

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
  Future<Either<Failure, User>> authenticated() async {
    try {
      return Right(await localDatabase.retrieve());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }


  @override
  Future<Either<Failure, User>> signIn(User user) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.signIn(user);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

}
