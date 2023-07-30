import 'package:get_it/get_it.dart';
import 'package:music_request/core/request/domain/usecases/list.dart';
import 'package:music_request/core/request/domain/usecases/search.dart';
import 'package:music_request/core/request/presentation/bloc/request_bloc.dart';

import 'data/database/remote_request_database.dart';
import 'data/repositories/request_repository_impl.dart';
import 'domain/repositories/request_repository.dart';
import 'domain/usecases/send_request.dart';

void initRequest() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Bloc
    ..registerFactory(() => RequestBloc(
        sendSongRequest: sl(), searchSong: sl(), authenticatedUser: sl()))

    /// Remote Database
    ..registerLazySingleton<RequestRemoteDatabase>(
        RequestRemoteDatabaseImpl.new)

    /// Register Repositories
    ..registerLazySingleton<RequestRepository>(
        () => RequestRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    /// Register Usecases
    ..registerLazySingleton(() => SendSongRequest(sl()))
    ..registerLazySingleton(() => ListRequests(sl()))
    ..registerLazySingleton(() => SearchSong(sl()));
}
