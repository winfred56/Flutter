import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/electorate.dart';
import '../repositories/electorate_repository.dart';

/// Logs a user out of an account
class LogoutUser implements Usecase<Electorate, NoParams> {
  /// Constructor
  LogoutUser(this.repository);

  /// Repository
  final ElectorateRepository repository;

  @override
  Future<Either<Failure, Electorate>> call(NoParams params) => repository.logout();
}
