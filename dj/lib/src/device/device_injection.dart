import 'package:get_it/get_it.dart';

import 'data/database/device_remote_database.dart';
import 'data/repositories/device_repository_impl.dart';
import 'domain/repositories/device_repository.dart';
import 'domain/usecases/create.dart';
import 'domain/usecases/list.dart';
import 'domain/usecases/retrieve.dart';

/// Add Device dependency
void initDevice() {
  final sl = GetIt.instance;

  /// usecase
  sl
    ..registerLazySingleton(() => CreateDevice(sl()))
    ..registerLazySingleton(() => RetrieveDevice(sl()))
    ..registerLazySingleton(() => ListDevices(sl()))
    ///  Repository
    ..registerLazySingleton<DeviceRepository>(() => DeviceRepositoryImpl(
        networkInfo: sl(), remoteDatabase: sl(), pushNotification: sl()))
    /// database
    ..registerLazySingleton<DeviceRemoteDatabase>(DeviceRemoteDatabaseImpl.new);
}
