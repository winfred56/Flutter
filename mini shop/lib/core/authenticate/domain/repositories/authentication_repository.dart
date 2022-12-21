import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/error/failure.dart';

/// Contracts for [AuthenticationRepositoryImpl]
abstract class AuthenticationRepository{
  /// Creates a new [User] instance
  Future<Either<Failure, void>> create(String email, String password);

  /// Log in an existing [User]
  Future<Either<Failure, void>> logIn(String email, String password);

  /// Log Out an existing [User]
  Future<Either<Failure, void>> logOut();


}