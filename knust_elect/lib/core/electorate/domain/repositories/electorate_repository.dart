import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/electorate.dart';

/// Contracts for [ElectorateRepositoryImpl]
abstract class ElectorateRepository {
  /// Authenticate User with email
  Future<Either<Failure, Electorate>> signIn(Electorate user);

  /// Updates a specific [Electorate] instance
  Future<Either<Failure, Electorate>> update(Electorate user);

  /// Retrieves an authenticated [Electorate] instance, saved locally
  Future<Either<Failure, Electorate>> authenticated();

  /// Logs [Electorate] out of account
  Future<Either<Failure, Electorate>> logout();

  /// Verify [Electorate] email address
  Future<Either<Failure,void>> verifyEmail();
}
