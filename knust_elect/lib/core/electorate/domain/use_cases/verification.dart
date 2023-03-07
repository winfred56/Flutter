import '../../../../shared/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/electorate_repository.dart';

class Verification implements Usecase<void, NoParams> {
  /// Constructor
  Verification(this.repository);

  /// Repository
  final ElectorateRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      repository.verifyEmail();
}
