import 'package:get_it/get_it.dart';
import 'package:knust_elect/core/electorate/domain/entities/electorate.dart';
import 'package:knust_elect/core/electorate/domain/use_cases/update.dart';

import 'data/database/electorate_local_database.dart';
import 'data/database/electorate_remote_database.dart';
import 'data/repositories/electorate_repository_impl.dart';
import 'domain/repositories/electorate_repository.dart';
import 'domain/use_cases/authenticated.dart';
import 'domain/use_cases/logout.dart';
import 'domain/use_cases/phone.dart';
import 'domain/use_cases/verification.dart';


void initElectorate() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Bloc

  /// Remote Database
    ..registerLazySingleton<ElectorateRemoteDatabase>(ElectorateRemoteDatabaseImpl.new)

  // Local Database
    ..registerLazySingleton<ElectorateLocalDatabase>(
            () => ElectorateLocalDatabaseImpl(sl()))

  /// Register Repositories
    ..registerLazySingleton<ElectorateRepository>(() => ElectorateRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl(), localDatabase: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => UpdateElectorate(sl()))
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => LogoutElectorate(sl()))
    ..registerFactory(() => Verification(sl()))
    ..registerLazySingleton(() => AuthenticatedElectorate(sl()));
}
