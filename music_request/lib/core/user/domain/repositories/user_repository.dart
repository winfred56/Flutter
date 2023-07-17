
import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/user.dart';

/// Contracts for [UserRepositoryImpl]
abstract class UserRepository {
  /// Creates [User] profile on firebase
  Future<Either<Failure, User>> createUser(User user);

  /// Updates a specific [User] instance
  Future<Either<Failure, User>> update(User user);

  /// Retrieves an authenticated [User] instance, saved remotely
  Future<Either<Failure, User>> retrieve(String documentID);

  /// Retrieves an authenticated [User] instance, saved locally
  Future<Either<Failure, User>> authenticatedUser();

  /// Logs [User] out of account
  Future<Either<Failure, User>> logout();

  /// Delete Account
  Future<Either<Failure, void>> deleteAccount(String documentID);
}