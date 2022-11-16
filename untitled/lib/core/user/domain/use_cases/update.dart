import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/errors/failure.dart';
import '../../../../shared/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class UpdateUser implements Usecase<User, UpdateUserParams> {
  /// Constructor
  UpdateUser(this.repository);

  /// repository
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
  List<Object?> get props => [user];
}
