import 'package:get_it/get_it.dart';
import 'package:knust_elect/core/student/domain/use_cases/update.dart';

import 'data/database/student_local_database.dart';
import 'data/database/student_remote_database.dart';
import 'data/repositories/student_repository_impl.dart';
import 'domain/repositories/student_repository.dart';
import 'domain/use_cases/authenticated.dart';
import 'domain/use_cases/logout.dart';
import 'domain/use_cases/signin.dart';
import 'domain/use_cases/verification.dart';


void initStudent() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

  /// Bloc

  /// Remote Database
    ..registerLazySingleton<StudentRemoteDatabase>(StudentRemoteDatabaseImpl.new)

  // Local Database
    ..registerLazySingleton<StudentLocalDatabase>(
            () => StudentLocalDatabaseImpl(sl()))

  /// Register Repositories
    ..registerLazySingleton<StudentRepository>(() => StudentRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl(), localDatabase: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => UpdateStudent(sl()))
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => LogoutStudent(sl()))
    ..registerFactory(() => Verification(sl()))
    ..registerLazySingleton(() => AuthenticatedStudent(sl()));
}
