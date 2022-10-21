import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/core/platform/network_info.dart';
import 'package:weather_app/features/current_weather/data/data_sources/weather_local_data_sources.dart';
import 'package:weather_app/features/current_weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_app/features/current_weather/data/repositories/weather_repository_impl.dart';

import 'weather_repository_impl_test.mocks.dart';


@GenerateMocks([NetworkInfo, WeatherRemoteDataSource, WeatherLocalDataSource])
void main() {
  WeatherRepositoryImpl repository;
  MockNetworkInfo mockNetworkInfo;
  MockWeatherLocalDataSource mockWeatherLocalDataSource;
  MockWeatherRemoteDataSource mockWeatherRemoteDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockWeatherLocalDataSource = MockWeatherLocalDataSource();
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();

    repository = WeatherRepositoryImpl(
        remoteDataSource: mockWeatherRemoteDataSource,
      localDataSource: mockWeatherLocalDataSource,
        networkInfo: mockNetworkInfo
    );
  });
}