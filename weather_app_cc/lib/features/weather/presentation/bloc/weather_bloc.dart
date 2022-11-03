import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/usecases/usecase.dart';
import 'package:weather_app_cc/core/utils/input_validations.dart';
import 'package:weather_app_cc/features/weather/domain/use_cases/getWeatherFromLocation.dart';

import '../../domain/entities/weather.dart';
import '../../domain/use_cases/getSpecificWeather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final GetSpecificWeather getWeather;
  final InputValidation inputValidation;
  final GetWeatherFromLocation getWeatherFromLocation;


  WeatherState get initialState => Empty();

  WeatherBloc({
    required this.getWeather,
    required this.inputValidation,
    required this.getWeatherFromLocation,
  }) : super(Empty()){
    on<GetWeatherForCity>((event, emit) async {

      final city = inputValidation.checkString(event.city);

      await city.fold((failure) async {
        emit(const Error(message: INVALID_INPUT_FAILURE_MESSAGE));
      }, (string) async {
        emit(Loading());
        final failureOrWeather = await getWeather(Params(city: string));

        await failureOrWeather.fold((failure) async {
          emit(Error(message: _mapFailureToMessage(failure)));
        }, (weather) async {
          print(weather);
          emit(Loaded(weather));
        });
      }
      );
    });
    on<GetWeatherBasedOnLocation>((event, emit) async {
      emit(Loading());
      final failureOrWeather = await getWeatherFromLocation(NoParams());
      await failureOrWeather.fold((failure) async {
        emit(Error(message: _mapFailureToMessage(failure)));
      }, (weather) async {
        emit(Loaded(weather));
      });
    });

  }


}
String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}