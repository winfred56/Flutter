import 'package:get_it/get_it.dart';
import 'package:untitled/core/user/domain/use_cases/login.dart';
import 'package:untitled/core/user/domain/use_cases/logout.dart';

import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/signup.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Remote Database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)

  // // Local Database
  //   ..registerLazySingleton<UserLocalDatabase>(
  //           () => UserLocalDatabaseImpl(sl()))

  /// Register Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => Logout(sl()))
    ..registerLazySingleton(() => Signup(sl()));
}