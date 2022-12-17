import 'package:dartz/dartz.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

import '../repositories/user_repository.dart';

/// Log out a specific [User] instance
class LogOut extends Usecase<void, NoParams> {
  /// Constructor
  LogOut(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) => repository.logOut();
}
