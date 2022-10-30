import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/usecases/usecase.dart';
import 'package:weather_app_cc/features/weather/domain/repositories/weather_repository.dart';

import '../entities/weather.dart';

class GetLocationWeather implements UseCase<WeatherEntity, LParams>{
  final WeatherRepository repository;
  
  GetLocationWeather(this.repository);
  
  @override
  Future<Either<Failure, WeatherEntity>> call(LParams parameter) async {
    return await repository.getLocationWeather(parameter.longitude, parameter.latitude);
  }
  
}

class LParams extends Equatable{
  double longitude;
  double latitude;

  LParams({required this.longitude, required this.latitude});
  @override
  // TODO: implement props
  List<Object?> get props => [longitude, latitude];

}