import '../../../../shared/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/user_repository.dart';

class DeleteAccount implements Usecase<void, StringParams> {
  /// Constructor
  DeleteAccount(this.repository);

  /// Repository
  final UserRepository repository;
  @override
  Future<Either<Failure, void>> call(StringParams params) =>
      repository.deleteAccount(params.value);
}
