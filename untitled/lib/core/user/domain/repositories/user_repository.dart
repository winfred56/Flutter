import 'package:dartz/dartz.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class UserRepository{
  /// Log in a specific user
  Future<Either<Failure, UserCredential>> logIn(String email, String password);
  /// Register a new user
  Future<Either<Failure, UserCredential>> signUp(String email, String password);
  /// Logs a specific user out
  Future<Either<Failure, User>> logOut(User user);
}