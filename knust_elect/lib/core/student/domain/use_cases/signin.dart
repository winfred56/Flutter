import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

/// Authenticate with email
class SignIn implements Usecase<Student, SignInParams> {
  /// Constructor
  SignIn(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, Student>> call(SignInParams params) =>
      repository.signIn(params.student);
}

/// Sign in params
class SignInParams extends Equatable {
  /// Constructor
  const SignInParams(this.student);

  /// Current user info
  final Student student;

  @override
  List<Object> get props => [student];
}
