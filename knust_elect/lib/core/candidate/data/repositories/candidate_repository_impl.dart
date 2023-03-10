import 'package:dartz/dartz.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/network/network.dart';
import '../../domain/entities/candidate.dart';
import '../../../../shared/error/failure.dart';
import '../../domain/repositories/candidate_repository.dart';
import '../database/candidate_remote_database.dart';

class CandidateRepositoryImpl implements CandidateRepository{
  /// Constructor
  CandidateRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDatabase});

  /// Dependencies
  NetworkInfo networkInfo;
  CandidateRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Candidate>> retrieve(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.retrieve(documentID);
      return Right(results);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

}