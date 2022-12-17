import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  /// Register a specific [User] with email & password
  Future<Either<Failure, void>> registerWithEmailAndPassword(
      String email, String password);

  /// Sign In a specific [User] with email & password
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password);

  /// Logs Out a specific [User]
  Future<Either<Failure, void>> logOut();

}
