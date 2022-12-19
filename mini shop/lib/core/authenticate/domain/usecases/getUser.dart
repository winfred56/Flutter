import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

import '../repositories/authentication_repository.dart';

class GetUser extends Usecase<Stream<User?>, NoParams> {
  /// Constructor
  GetUser(this.repository);

  AuthenticationRepository repository;

  @override
  Future<Either<Failure, Stream<User?>>> call(NoParams params) =>
      repository.getUserStatus();
}
