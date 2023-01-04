import 'package:dawurobo/src/profile/domain/use_cases/retrieve_profile.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/profile_remote_database.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'presentation/bloc/ProfileBloc.dart';


void initProfile() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Bloc
    ..registerFactory(() => ProfileBloc(profile: sl()))

  /// Remote Database
    ..registerLazySingleton<ProfileRemoteDatabase>(ProfileRemoteDatabaseImpl.new)



  /// Register Repositories
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => RetrieveProfile(sl()));
}
