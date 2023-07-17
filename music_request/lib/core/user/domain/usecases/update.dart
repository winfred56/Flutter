import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Updates a [User] instance
class UpdateUser extends Usecase<User, UpdateUserParams> {
  /// Constructor
  UpdateUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(UpdateUserParams params) =>
      repository.update(params.user);
}

class UpdateUserParams extends Equatable {
  /// Constructor
  const UpdateUserParams(this.user);

  /// Params
  final User user;

  @override
  List<Object> get props => [user];
}
