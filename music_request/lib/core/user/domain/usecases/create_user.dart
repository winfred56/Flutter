import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Creates [User] profile on firebase
class CreateUser implements Usecase<User, CreateUserParams> {
  /// Constructor
  CreateUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(CreateUserParams params) =>
      repository.createUser(params.user);
}

/// Sign in params
class CreateUserParams extends Equatable {
  /// Constructor
  const CreateUserParams(this.user);

  /// Current user info
  final User user;

  @override
  List<Object> get props => [user];
}
