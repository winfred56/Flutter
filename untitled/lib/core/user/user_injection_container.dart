import 'package:get_it/get_it.dart';
import 'package:untitled/core/user/domain/use_cases/phone_Sign_In.dart';

import 'data/database/remote_database.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/authenticate.dart';
import 'domain/use_cases/update.dart';

void initUser() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Remote Database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)


  /// Register Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => PhoneSignIn(sl()))
    ..registerLazySingleton(() => AuthenticatedUser(sl()));
}
