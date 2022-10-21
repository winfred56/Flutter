import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  /// calls the https://api.openweathermap.org/data/2.5/weather?q={city}&appid={token} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherModel> getWeather(String city);
}