import 'package:dawurobo/core/user/domain/use_cases/authenticated.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/local_database.dart';
import 'data/data_sources/remote_database.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/sign_in.dart';
import 'domain/use_cases/update.dart';
import 'presentation/bloc/user_bloc.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Bloc
    ..registerFactory(() => UserBloc(updateUser: sl(), createProfile: sl(), createDevice: sl(), authenticatedUser: sl()))

  /// Remote Database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)

  // Local Database
    ..registerLazySingleton<UserLocalDatabase>(
            () => UserLocalDatabaseImpl(sharedPreferences: sl()))


  /// Register Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl(), localDatabase: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => AuthenticatedUser(sl()))
    ..registerLazySingleton(() => SignIn(sl()));
}
