import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Logs a user out of an account
class LogoutUser implements Usecase<User, NoParams> {
  /// Constructor
  LogoutUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) => repository.logout();
}
