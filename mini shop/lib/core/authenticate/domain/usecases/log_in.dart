import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_shop/shared/error/failure.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class LogIn extends Usecase<User?, LogInParams> {
  /// Constructor
  LogIn(this.repository);

  AuthenticationRepository repository;

  @override
  Future<Either<Failure, User?>> call(params) =>
      repository.logIn(params.email, params.password);

}

class LogInParams extends Equatable {
  /// Constructor
  const LogInParams(this.email, this.password);

  /// Parameter fields
  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];

}