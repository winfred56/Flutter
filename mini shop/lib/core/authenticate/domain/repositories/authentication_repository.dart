import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/error/failure.dart';

/// Contracts for [AuthenticationRepositoryImpl]
abstract class AuthenticationRepository{
  /// Creates a new [User] instance
  Future<Either<Failure, User?>> create(String email, String password);

  /// Log in an existing [User]
  Future<Either<Failure, User?>> logIn(String email, String password);

  /// Log Out an existing [User]
  Future<Either<Failure, void>> logOut();

  /// Get [User] status (logged in / logged out)
  Future<Either<Failure, Stream<User?>>> getUserStatus();
}