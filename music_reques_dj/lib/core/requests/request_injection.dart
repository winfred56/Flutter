import 'package:get_it/get_it.dart';
import 'package:music_reques_dj/core/requests/domain/usecases/list.dart';

import 'data/database/request_remote_database.dart';
import 'data/repositories/request_repository_impl.dart';
import 'domain/repositories/request_repository.dart';
import 'domain/usecases/update.dart';
import 'presentation/bloc/request_bloc.dart';

void initRequest() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Bloc
    ..registerFactory(() => RequestBloc(
          authenticatedUser: sl(),
          listRequests: sl(),
          updateRequest: sl(),
        ))

    /// Remote Database
    ..registerLazySingleton<RequestRemoteDatabase>(
        RequestRemoteDatabaseImpl.new)

    /// Register Repositories
    ..registerLazySingleton<RequestRepository>(
        () => RequestRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    /// Register Usecases
    ..registerLazySingleton(() => ListRequests(sl()))
    ..registerLazySingleton(() => UpdateRequest(sl()));
}
