import 'package:dartz/dartz.dart';
import 'package:mini_shop/shared/error/failure.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class LogOut extends Usecase<void, NoParams> {
  /// Constructor
  LogOut(this.repository);

  AuthenticationRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) => repository.logOut();
}
