import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:weather_app/features/current_weather/domain/repositories/weather_repository.dart';

import 'get_current_weather_tests.mocks.dart';


@GenerateMocks([WeatherRepository])

void main() {
  MockWeatherRepository mockWeatherRepository = MockWeatherRepository();
}