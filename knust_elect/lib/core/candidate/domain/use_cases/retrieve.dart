import 'package:dartz/dartz.dart';

import '../entities/candidate.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../repositories/candidate_repository.dart';

class RetrieveCandidate implements Usecase<Candidate, StringParams> {
  /// Constructor
  RetrieveCandidate(this.repository);

  /// Repository
  final CandidateRepository repository;

  @override
  Future<Either<Failure, Candidate>> call(StringParams params) =>
      repository.retrieve(params.value);
}
