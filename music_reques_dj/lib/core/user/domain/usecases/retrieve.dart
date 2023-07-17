import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RetrieveUser implements Usecase<User, StringParams> {
  /// Constructor
  RetrieveUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(StringParams params) =>
      repository.retrieve(params.value);
}
