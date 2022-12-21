import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../data_sources/authentication_remote_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {

  /// Constructor
  AuthenticationRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  AuthenticationRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, void>> create(String email, String password) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatasource.create(email, password);
      return Right(results);
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From create Method in AuthenticationRepositoryImpl --> authentication_repository_impl');
      }
      return const Left(Failure('Error Creating An Account'));
    }
  }


  @override
  Future<Either<Failure, void>> logIn(String email, String password) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatasource.logIn(email, password);
      return Right(results);
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From logIn Method in AuthenticationRepositoryImpl --> authentication_repository_impl');
      }
      return const Left(Failure('Error Logging Into Your Account'));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await networkInfo.hasInternet();
      await remoteDatasource.logOut();
      return const Right(null);
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From logOut Method in AuthenticationRepositoryImpl --> authentication_repository_impl');
      }
      return const Left(Failure('Error Logging Into Your Account'));
    }
  }
}


