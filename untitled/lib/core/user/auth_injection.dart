import 'package:get_it/get_it.dart';

import 'data/data_sources/remote_data_source.dart';
import 'data/repository/auth_repository_impl.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Remote Database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)

  /// Register Repositories
    ..registerLazySingleton<Object>(() => UserRepositoryImpl(
        networkInfo: sl(), remoteDataSource: sl()));

  /// Register Usecases
  //   ..registerLazySingleton(() => AuthenticatedUser(sl()));
}