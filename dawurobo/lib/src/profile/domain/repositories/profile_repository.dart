import 'package:dartz/dartz.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../shared/error/failure.dart';

abstract class ProfileRepository{
  /// Get a specific [User] profile
  Future<Either<Failure, User>> retrieveProfile(String documentID);
}