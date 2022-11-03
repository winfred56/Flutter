import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String city);

  Future<WeatherModel> getWeatherFromLocation();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeather(String city) async {
    final response = await client.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c330d38488eaacd395107dc72eb0fd5d'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<WeatherModel> getWeatherFromLocation() async {
    double latitude;
    double longitude;
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    /// Get Coordinates;
    latitude = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) => latitude = position.latitude);
    longitude = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) => longitude = position.longitude);
    print('$latitude, $longitude from remoteDataSource');

    /// Get weather data
    final response = await client.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=c330d38488eaacd395107dc72eb0fd5d&lang=en'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print('${WeatherModel.fromJson(json.decode(response.body))} --- from remoteDataSource');
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}



//'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=c330d38488eaacd395107dc72eb0fd5d&lang=en'),
