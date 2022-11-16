import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../entities/user.dart';

/// Contracts for [UserRepositoryImpl]
abstract class UserRepository{
  /// Authenticate User with phone auth
  Future<Either<Failure,User>> signInPhone(User user);

  /// Updates a specific [User] instance
  Future<Either<Failure,User>> update(User user);

  /// Retrieves an authenticated [User] instance
  Future<Either<Failure,User>> authenticate();
}