import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:untitled/shared/errors/failure.dart';

import '../../../../shared/network/network.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
    //required this.localDatabase
  });

  /// Dependencies
  NetworkInfo networkInfo;
  UserRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, UserCredential>> logIn(String email, String password) async {
    try{
      await networkInfo.isConnected;
      final result = remoteDatabase.login(email, password);
      return Right(result as UserCredential);
    } on Exception {
      return const Left(Failure('Login failed'));
    }
  }

  @override
  Future<Either<Failure, User>> logOut(User user) async {
    try{
      await networkInfo.isConnected;
      final result = remoteDatabase.logout(user);
      return Right(result as User);
    } on Exception {
      return const Left(Failure('Logout failed'));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(String email, String password) async {
    try{
      await networkInfo.isConnected;
      final result = remoteDatabase.signup(email, password);
      return Right(result as UserCredential);
    } on Exception {
      return const Left(Failure('Login failed'));
    }
  }
  //UserLocalDatabase localDatabase;
}
