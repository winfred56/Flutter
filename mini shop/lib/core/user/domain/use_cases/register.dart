import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// register a new [User] instance
class Register extends Usecase<void, RegisterParams> {
  /// Constructor
  Register(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(params) =>
      repository.registerWithEmailAndPassword(params.email, params.password);
}

class RegisterParams extends Equatable {
  /// Constructor
  const RegisterParams(this.email, this.password);

  /// email
  final String email;

  /// Password
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
