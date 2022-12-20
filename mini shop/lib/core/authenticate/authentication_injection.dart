import 'package:get_it/get_it.dart';

import 'data/data_sources/authentication_remote_datasource.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/usecases/create.dart';
import 'domain/usecases/getUser.dart';
import 'domain/usecases/log_in.dart';
import 'presentation/bloc/auth_bloc.dart';
import 'domain/usecases/log_out.dart';



/// [ProfileBloc] Dependencies
void initAuthentication() {
  final sl = GetIt.instance;

  sl

  /// Remote Database
    ..registerLazySingleton<AuthenticationRemoteDatasource>(
        AuthenticationRemoteDatasourceImpl.new)

  /// Register Repositories
    ..registerLazySingleton<AuthenticationRepository>(() =>
        AuthenticationRepositoryImpl(networkInfo: sl(), remoteDatasource: sl()))

  /// Register Usecases
    ..registerLazySingleton(() => Create(sl()))
    ..registerLazySingleton(() => LogIn(sl()))
    ..registerLazySingleton(() => LogOut(sl()))
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerFactory(() => AuthenticationBloc(
        create: sl(), logOut: sl(), logIn: sl()));
}
