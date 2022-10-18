import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/use_cases/use_case.dart';
import 'package:weather_app/features/current_weather/domain/repositories/weather_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/weather.dart';


class GetCurrentWeather implements UseCase<Weather, Params>{
  final WeatherRepository repository;
  GetCurrentWeather(this.repository);

  @override
  Future<Either<Failure, Weather>> call(Params params) async{
    return await repository.getCurrentWeather(params.city);
  }

}

class Params extends Equatable{
  final String city;
  const Params({required this.city});

  @override
  // TODO: implement props
  List<Object?> get props => [city];
}