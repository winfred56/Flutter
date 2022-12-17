import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shop/core/user/domain/repositories/user_repository.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

import '../entities/user.dart';

/// Sign in a [User] instance
class SignIn extends Usecase<void, SignInParams> {
  /// Constructor
  SignIn(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(SignInParams params) =>
      repository.signInWithEmailAndPassword(params.email, params.password);
}

class SignInParams extends Equatable {
  /// Constructor
  const SignInParams(this.email, this.password);

  /// email
  final String email;

  /// Password
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
