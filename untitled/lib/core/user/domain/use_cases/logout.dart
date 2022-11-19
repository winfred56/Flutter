import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/core/user/domain/repositories/user_repository.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:untitled/shared/usecases/usecase.dart';

class Logout extends Usecase<User, LogoutParams> {
  /// Constructor
  Logout(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(params) => repository.logOut(params.user);
}

class LogoutParams extends Equatable {
  /// Constructor
  const LogoutParams(this.user);

  final User user;

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
