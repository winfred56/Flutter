import 'package:get_it/get_it.dart';
import 'package:mini_shop/core/user/domain/use_cases/log_out.dart';
import 'package:mini_shop/core/user/domain/use_cases/register.dart';
import 'package:mini_shop/core/user/presentation/bloc/user_bloc.dart';

import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/sign_In.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Remote Database
    ..registerLazySingleton<UserRemoteDatasource>(UserRemoteDatasourceImpl.new)

    // // Local Database
    // ..registerLazySingleton<UserLocalDatabase>(
    //     () => UserLocalDatabaseImpl(sl()))

    /// Register Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
          remoteDatabase: sl(),
          networkInfo: sl(),
        ))

    /// Register Usecases
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => LogOut(sl()))
    ..registerLazySingleton(() => Register(sl()))
    ..registerFactory(
        () => UserBloc(signInUser: sl(), logOutUser: sl(), registerUser: sl()));
}
