import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

import '../repositories/authentication_repository.dart';

/// Custom use case
abstract class GetUserUsecase<Type, Params> {
  /// Contract call method
  Either<Failure, Type> call(Params params);
}


class GetUser extends GetUserUsecase<Stream<User?>, NoParams> {
  /// Constructor
  GetUser(this.repository);

  AuthenticationRepository repository;

  @override
  Either<Failure, Stream<User?>> call(NoParams params) =>
      repository.getUserStatus();
}
