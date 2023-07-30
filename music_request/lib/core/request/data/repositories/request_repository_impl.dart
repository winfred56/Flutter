import 'package:dartz/dartz.dart';
import 'package:music_request/core/request/domain/entities/request.dart';

import 'package:music_request/core/request/domain/entities/song.dart';

import 'package:music_request/shared/error/failure.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/request_repository.dart';
import '../database/remote_request_database.dart';

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
  Future<Either<Failure, Request>> sendRequest(Request request) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.sendRequest(request);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Song>>> search(String songTitle) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.searchForSong(songTitle);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
