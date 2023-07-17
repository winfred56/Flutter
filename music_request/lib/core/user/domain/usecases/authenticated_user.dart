import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Retrieves an authenticated [User] instance saved locally
class AuthenticatedUser extends Usecase<User, NoParams> {
  /// Constructor
  AuthenticatedUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) =>
      repository.authenticatedUser();
}
