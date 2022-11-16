import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:untitled/shared/usecases/usecase.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Authenticate with phone
class PhoneSignIn extends Usecase<User, PhoneSignInParams> {
  /// Constructor
  PhoneSignIn(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(PhoneSignInParams params) =>
      repository.signInPhone(params.user);
}

/// Authenticate with phone parameters
class PhoneSignInParams extends Equatable {
  /// Constructor
  const PhoneSignInParams(this.user);

  /// Current user info
  final User user;

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
