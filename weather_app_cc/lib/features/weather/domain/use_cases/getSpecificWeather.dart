import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/usecases/usecase.dart';
import 'package:weather_app_cc/features/weather/domain/entities/weather.dart';
import 'package:weather_app_cc/features/weather/domain/repositories/weather_repository.dart';

class GetSpecificWeather implements UseCase<WeatherEntity, Params> {
  final WeatherRepository repository;

  GetSpecificWeather(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(parameter) async {
    return await repository.getWeather(parameter.city);

  }
}

class Params extends Equatable{
  String city;
  Params({required this.city});

  @override
  // TODO: implement props
  List<Object?> get props => [city];

}