import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/current_weather/data/data_sources/weather_local_data_sources.dart';
import 'package:weather_app/features/current_weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/features/current_weather/domain/entities/weather.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  final WeatherLocalDataSource localDataSource;
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource
  });

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String city) {
    // TODO: implement getCurrentWeather
    throw UnimplementedError();
  }

}