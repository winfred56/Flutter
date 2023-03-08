import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

/// Updates a [Student] instance
class UpdateStudent extends Usecase<Student, UpdateStudentParams> {
  /// Constructor
  UpdateStudent(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, Student>> call(UpdateStudentParams params) =>
      repository.update(params.student);
}

class UpdateStudentParams extends Equatable {
  /// Constructor
  const UpdateStudentParams(this.student);

  /// Params
  final Student student;

  @override
  List<Object> get props => [student];
}
