import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/usecases/usecase.dart';
import 'package:weather_app_cc/features/weather/domain/entities/weather.dart';
import 'package:weather_app_cc/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherFromLocation extends UseCase<WeatherEntity, LocationParams> {
  final WeatherRepository repository;

  GetWeatherFromLocation(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(parameter) async {
    return await repository.getWeatherFromLocation(
        parameter.latitude, parameter.longitude);
  }
}

class LocationParams extends Equatable {
  double latitude;
  double longitude;

  LocationParams({required this.latitude, required this.longitude});

  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude];
}
