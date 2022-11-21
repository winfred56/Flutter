import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/core/user/domain/repositories/user_repository.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:untitled/shared/usecases/usecase.dart';


class Login extends Usecase<UserCredential, LoginParams> {
  /// Constructor
  Login(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) =>
      repository.logIn(params.email, params.password);
}

class LoginParams extends Equatable {
  /// Constructor
  const LoginParams(this.email, this.password);

  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}