import 'package:dartz/dartz.dart';
import 'package:knust_elect/shared/error/failure.dart';

import '../../../../shared/usecase/usecase.dart';
import '../entities/student.dart';
import '../repositories/student_repository.dart';

class RetrieveStudent implements Usecase<Student, StringParams> {
  /// Constructor
  RetrieveStudent(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, Student>> call(StringParams params) =>
      repository.retrieve(params.value);
}
