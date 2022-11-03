part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForCity extends WeatherEvent {
  final String city;
  const GetWeatherForCity(this.city);
}

class GetWeatherForLocation extends WeatherEvent {}