import 'package:dartz/dartz.dart';
import 'package:knust_elect/core/electorate/domain/entities/electorate.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/electorate_repository.dart';
import '../database/electorate_local_database.dart';
import '../database/electorate_remote_database.dart';

class ElectorateRepositoryImpl implements ElectorateRepository {
  /// Constructor
  ElectorateRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDatabase,
      required this.localDatabase});

  /// Dependencies
  NetworkInfo networkInfo;
  ElectorateRemoteDatabase remoteDatabase;
  ElectorateLocalDatabase localDatabase;

  @override
  Future<Either<Failure, Electorate>> update(Electorate electorate) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.update(electorate);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Electorate>> authenticated() async {
    try {
      return Right(await localDatabase.retrieve());
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Electorate>> signIn(Electorate electorate) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.signIn(electorate);
      await localDatabase.save(results);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Electorate>> logout() async {
    try {
      final result = Electorate.initial();
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
