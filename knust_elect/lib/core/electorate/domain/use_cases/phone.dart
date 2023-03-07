import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/electorate.dart';
import '../repositories/electorate_repository.dart';

/// Authenticate with email
class SignIn implements Usecase<Electorate, SignInParams> {
  /// Constructor
  SignIn(this.repository);

  /// Repository
  final ElectorateRepository repository;

  @override
  Future<Either<Failure, Electorate>> call(SignInParams params) =>
      repository.signIn(params.electorate);
}

/// Sign in params
class SignInParams extends Equatable {
  /// Constructor
  const SignInParams(this.electorate);

  /// Current user info
  final Electorate electorate;

  @override
  List<Object> get props => [electorate];
}
