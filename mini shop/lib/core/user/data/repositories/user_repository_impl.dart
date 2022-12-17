import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mini_shop/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  UserRemoteDatasource remoteDatabase;

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await networkInfo.hasInternet();
      final result = await remoteDatabase.logOut();
      return right(result);
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('From User_repository_impl logOut block');
      }
      return left(const Failure('Error Logging Out'));
    }
  }

  @override
  Future<Either<Failure, void>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await networkInfo.hasInternet();
      final result = await remoteDatabase.register(email, password);
      return right(result);
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('From User_repository_impl Register block');
      }
      return left(const Failure('Error Registering'));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      String email, String password) async {
    try{
      await networkInfo.hasInternet();
      final result = await remoteDatabase.signIn(email, password);
      return right(result);
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('From User_repository_impl Sign In block');
      }
      return left(const Failure('Error Logging In'));
    }
  }
}
