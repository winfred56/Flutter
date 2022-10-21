import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached [WeatehrModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<WeatherModel> getLastWeather();

  Future<void> cacheWeather(WeatherModel weather);
}