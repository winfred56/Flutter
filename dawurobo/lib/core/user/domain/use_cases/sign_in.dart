import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';


class SignIn implements Usecase<User, SignInParams> {
  /// Constructor
  SignIn(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(SignInParams params) =>
      repository.signIn(params.user);
}

/// Sign in params
class SignInParams extends Equatable {
  /// Constructor
  const SignInParams(this.user);

  /// Current user info
  final User user;

  @override
  List<Object> get props => [user];
}
