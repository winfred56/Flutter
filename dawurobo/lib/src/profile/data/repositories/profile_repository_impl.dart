import 'package:dartz/dartz.dart';

import 'package:dawurobo/core/user/domain/entities/user.dart';

import 'package:dawurobo/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_remote_database.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  /// Constructor
  ProfileRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  ProfileRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, User>> retrieveProfile(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.retrieveUserProfile(documentID);
      return Right(results);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}