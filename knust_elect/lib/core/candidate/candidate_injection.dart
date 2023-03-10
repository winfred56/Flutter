import 'package:get_it/get_it.dart';

import 'data/database/candidate_remote_database.dart';
import 'data/repositories/candidate_repository_impl.dart';
import 'domain/repositories/candidate_repository.dart';
import 'domain/use_cases/retrieve.dart';

void initStudent() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Bloc

    /// Remote Database
    ..registerLazySingleton<CandidateRemoteDatabase>(
        CandidateRemoteDatabaseImpl.new)

    /// Register Repositories
    ..registerLazySingleton<CandidateRepository>(
        () => CandidateRepositoryImpl(remoteDatabase: sl(), networkInfo: sl()))

    /// Register Usecases
    ..registerLazySingleton(() => RetrieveCandidate(sl()));
}
