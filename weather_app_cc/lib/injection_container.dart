import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network_info/network_info.dart';
import 'core/utils/input_validations.dart';
import 'features/weather/data/data_sources/local_data_sources.dart';
import 'features/weather/data/data_sources/remote_data_sources.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/domain/repositories/weather_repository.dart';
import 'features/weather/domain/use_cases/getSpecificWeather.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///! Features -Weather

  // Bloc
  sl.registerFactory(() => WeatherBloc(
        getWeather: sl(),
        inputValidation: sl(),
        locationValidator: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => GetSpecificWeather(sl()));

  // Repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        network_info: sl(),
      ));

  //data sources
  sl.registerLazySingleton<WeatherLocalDataSource>(
      () => WeatherLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));

  ///! Core
  sl.registerLazySingleton(() => InputValidation());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
