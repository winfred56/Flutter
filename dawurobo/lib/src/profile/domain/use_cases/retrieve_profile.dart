import 'package:dartz/dartz.dart';
import 'package:dawurobo/shared/error/failure.dart';
import 'package:dawurobo/shared/usecase/usecase.dart';
import 'package:dawurobo/src/profile/domain/repositories/profile_repository.dart';

import '../../../../core/user/domain/entities/user.dart';

class RetrieveProfile extends Usecase<User, StringParams>{

  /// Constructor
  RetrieveProfile(this.repository);
  ProfileRepository repository;

  @override
  Future<Either<Failure, User>> call(StringParams params) => repository.retrieveProfile(params.value);
}