import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/electorate.dart';
import '../repositories/electorate_repository.dart';

/// Retrieves an authenticated [Electorate] instance saved locally
class AuthenticatedElectorate extends Usecase<Electorate, NoParams> {
  /// Constructor
  AuthenticatedElectorate(this.repository);

  /// Repository
  final ElectorateRepository repository;

  @override
  Future<Either<Failure, Electorate>> call(NoParams params) =>
      repository.authenticated();
}
