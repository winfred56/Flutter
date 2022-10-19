
import 'package:weather_app/features/current_weather/domain/entities/weather.dart';

class WeatherModel extends Weather{
  const WeatherModel({required super.temp, required super.humidity}) : super();


  @override
  List<Object?> get props => [temp, humidity];

  factory WeatherModel.fromJson (Map<String, dynamic> json){
    return WeatherModel(
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "temp": 28.0,
      "humidity": 67,
    };
  }

}