import 'package:dawurobo/core/post/presentation/bloc/PostBloc.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/post_remote_database.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/repositories/post_repository.dart';
import 'domain/use_cases/create.dart';



void initPost() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Bloc
    ..registerFactory(() => PostBloc(createPost: sl()))

  /// Remote Database
    ..registerLazySingleton<PostRemoteDatabase>(PostRemoteDatabaseImpl.new)


  /// Register Repositories
    ..registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => CreatePost(sl()));
}