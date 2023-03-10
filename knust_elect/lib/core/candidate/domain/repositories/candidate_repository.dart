import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/candidate.dart';

abstract class CandidateRepository{
  /// Retrieves a [Candidate] instance, saved remotely
  Future<Either<Failure, Candidate>> retrieve(String documentID);
}