import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

/// Logs a user out of an account
class LogoutStudent implements Usecase<Student, NoParams> {
  /// Constructor
  LogoutStudent(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, Student>> call(NoParams params) => repository.logout();
}
