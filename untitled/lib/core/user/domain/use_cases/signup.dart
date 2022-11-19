import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/core/user/domain/repositories/user_repository.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:untitled/shared/usecases/usecase.dart';

class Signup extends Usecase<UserCredential, SignUpParams> {
  /// Constructor
  Signup(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserCredential>> call(SignUpParams params) =>
      repository.signUp(params.email, params.password);

}

class SignUpParams extends Equatable {
  /// Constructor
  const SignUpParams(this.email, this.password);

  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
