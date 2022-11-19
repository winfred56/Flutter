import 'package:dartz/dartz.dart';
import 'package:untitled/core/user/domain/entities/user.dart';
import 'package:untitled/shared/errors/failure.dart';

abstract class UserRepository{
  /// Log in a specific user
  Future<Either<Failure, User>> logIn(String email, String password);
  /// Register a new user
  Future<Either<Failure, User>> signUp(String email, String password);
  /// Logs a specific user out
  Future<Either<Failure, User>> logOut(User user);
  // /// Updates a specific [User] instance
  // Future<Either<Failure, User>> update(User user);
}