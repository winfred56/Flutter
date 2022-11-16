import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class AuthenticatedUser extends Usecase<User, NoParams> {
  /// Constructor
  AuthenticatedUser(this.repository);

  /// repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) =>
      repository.authenticate();
}
