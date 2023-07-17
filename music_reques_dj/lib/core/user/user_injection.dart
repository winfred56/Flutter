import 'package:get_it/get_it.dart';

import 'data/database/user_local_database.dart';
import 'data/database/user_remote_database.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/authenticated_user.dart';
import 'domain/usecases/create_user.dart';
import 'domain/usecases/delete.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/retrieve.dart';
import 'domain/usecases/update.dart';
import 'presentation/bloc/user_bloc.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Bloc
    ..registerFactory(() => UserBloc(
        authenticatedUser: sl(),
        logoutUser: sl(),
        updateUser: sl(),
        deleteAccount: sl()))

    /// Remote Database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)

    // Local Database
    ..registerLazySingleton<UserLocalDatabase>(
        () => UserLocalDatabaseImpl(sl()))

    /// Register Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl(), localDatabase: sl()))

    /// Register Usecases
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => LogoutUser(sl()))
    ..registerLazySingleton(() => RetrieveUser(sl()))
    ..registerLazySingleton(() => DeleteAccount(sl()))
    ..registerLazySingleton(() => AuthenticatedUser(sl()));
}
