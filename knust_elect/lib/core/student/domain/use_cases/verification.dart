import '../../../../shared/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/student_repository.dart';

class Verification implements Usecase<void, NoParams> {
  /// Constructor
  Verification(this.repository);

  /// Repository
  final StudentRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      repository.verifyEmail();
}
