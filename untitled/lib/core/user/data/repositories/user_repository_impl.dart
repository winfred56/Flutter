import 'package:dartz/dartz.dart';

import '../database/remote_database.dart';
import '../../domain/entities/user.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  /// Constructor
  UserRepositoryImpl({
    required this.remoteDatabase,
    required this.networkInfo
});

  NetworkInfo networkInfo;
  UserRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, User>> authenticate() async {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signInPhone(User user) async {
    try {
      await networkInfo.isConnected();
      final results = await remoteDatabase.signInPhone(user);
      return Right(results);
    } on Exception{
      return const Left(Failure('Error signing in'));
    }
  }

  @override
  Future<Either<Failure, User>> update(User user) async{
    try{
      await networkInfo.isConnected();
      final results = await remoteDatabase.update(user);
      return Right(results);
    } on Exception catch (e) {
      return Left(Failure('$e Error'));
    }
  }

}