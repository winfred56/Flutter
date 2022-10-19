import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/current_weather/data/models/weather_model.dart';
import 'package:weather_app/features/current_weather/domain/entities/weather.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  var tWeatherModel =  const WeatherModel(temp: 28, humidity: 67);
  
  test('Should be a subclass of Weather entity', () {
    /// assert
    expect(tWeatherModel, isA<Weather>());
  });
  
  group("from Json", () {
    test('Should return a valid weather model', () async {
      /// arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('fixtures.json'));

      /// act
      final result = WeatherModel.fromJson(jsonMap);
      
      /// assert
      expect(result, tWeatherModel);
    });
  });
  
  group('toJson', () {
    test('should return a JSON map containing the proper data', () async
    {
      /// arrange
      final reuslt = tWeatherModel.toJson();

      /// assert
      final expectedJsonMap = {
        "temp": 28.0,
        "humidity": 67,
      };
    }
    );
  });
}