import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/student.dart';

/// Contracts for [StudentRepositoryImpl]
abstract class StudentRepository {
  /// Authenticate User with email
  Future<Either<Failure, Student>> signIn(Student user);

  /// Updates a specific [Student] instance
  Future<Either<Failure, Student>> update(Student user);

  /// Retrieves an authenticated [Student] instance, saved locally
  Future<Either<Failure, Student>> authenticated();

  /// Logs [Student] out of account
  Future<Either<Failure, Student>> logout();

  /// Verify [Student] email address
  Future<Either<Failure,void>> verifyEmail();
}
