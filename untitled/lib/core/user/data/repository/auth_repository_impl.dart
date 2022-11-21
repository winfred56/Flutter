import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/shared/errors/failure.dart';
import 'package:untitled/shared/network/network.dart';

import '../data_sources/remote_data_source.dart';

class UserRepositoryImpl {
  /// Constructor
  UserRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  final NetworkInfo networkInfo;
  final UserRemoteDatabaseImpl remoteDataSource;

  /// Log in a user
  Future<Object> login(String email, String password) async{
    try{
      await networkInfo.isConnected();
      final result = await remoteDataSource.authLogin(email, password);
      return result;
    } on Exception catch (e) {
      return Failure('Login Error. ${e.toString}');
    }
  }

  /// Logout a user
  Future<Object> logout() async{
    try{
      await networkInfo.isConnected();
      final result = await remoteDataSource.authLogOut();
      return result;
    } on Exception catch (e) {
      return Failure('Login Error. ${e.toString}');
    }
  }

  /// Register a new user
  Future<Object> signUp(String email, String password) async{
    try{
      await networkInfo.isConnected();
      final result = await remoteDataSource.authSignUp(email, password);
      return result;
    } on Exception catch (e) {
      return Failure('Login Error. ${e.toString}');
    }
  }
}
