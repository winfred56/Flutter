import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/features/current_weather/domain/entities/weather.dart';
import 'package:weather_app/features/current_weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/current_weather/domain/use_cases/get_current_weather.dart';

import 'get_current_weather_tests.mocks.dart';


@GenerateMocks([WeatherRepository])

void main() {
  MockWeatherRepository mockWeatherRepository = MockWeatherRepository();
  var tCity = 'New York';
  var tWeather = const Weather(temp: 27, humidity: 40);
  var usecase = GetCurrentWeather(mockWeatherRepository);
  
  test('Should return Weather', () async {
    /// arrange
    when(mockWeatherRepository.getCurrentWeather(any)).thenAnswer((_) async => Right(tWeather));

    /// act
    final result = await usecase(Params(city: tCity));

    /// assert
    expect(result, Right(tWeather));
    verify(mockWeatherRepository.getCurrentWeather(tCity));
    verifyNoMoreInteractions(mockWeatherRepository);
  });
}