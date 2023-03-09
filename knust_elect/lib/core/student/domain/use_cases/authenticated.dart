import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

/// Retrieves an authenticated [Student] instance saved locally
class AuthenticatedStudent extends Usecase<Student, NoParams> {
  /// Constructor
  AuthenticatedStudent(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, Student>> call(NoParams params) =>
      repository.authenticated();
}
