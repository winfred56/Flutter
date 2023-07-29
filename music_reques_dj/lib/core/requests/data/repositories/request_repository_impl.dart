import 'package:dartz/dartz.dart';

import '../../../../shared/error/exception.dart';
import '../../domain/entities/request.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/request_repository.dart';
import '../database/request_remote_database.dart';

class RequestRepositoryImpl implements RequestRepository {
  /// Constructor
  RequestRepositoryImpl(
      {required this.networkInfo, required this.remoteDatabase});

  /// Dependencies
  NetworkInfo networkInfo;
  RequestRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Stream<List<Request>>>> list(String djID) async {
    try {
      await networkInfo.hasInternet();
      final results = remoteDatabase.list(djID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Request>> update(Request request) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.update(request);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
