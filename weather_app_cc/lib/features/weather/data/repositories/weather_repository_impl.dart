import 'package:dartz/dartz.dart';
import 'package:weather_app_cc/core/network_info/network_info.dart';
import 'package:weather_app_cc/features/weather/data/data_sources/remote_data_sources.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_sources/local_data_sources.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo network_info;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.network_info
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(String city) async {
    if (await network_info.isConnected()) {
      try {
        final remoteWeather = await remoteDataSource.getWeather(city);
        localDataSource.cacheWeather(remoteWeather);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getPreviousWeather();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>> getLocationWeather(double latitude,
      double longitude) async {
    if (await network_info.isConnected()) {
      try {
        final remoteWeather = await remoteDataSource.getLocationWeather(
            latitude, longitude);
        localDataSource.cacheWeather(remoteWeather);
        return Right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try {
        final localWeather = await localDataSource.getPreviousWeather();
        return Right(localWeather);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }

}
