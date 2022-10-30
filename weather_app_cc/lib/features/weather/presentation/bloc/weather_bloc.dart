import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/utils/input_validations.dart';
import 'package:weather_app_cc/core/utils/locationValidation.dart';

import '../../domain/entities/weather.dart';
import '../../domain/use_cases/getLocationWeather.dart';
import '../../domain/use_cases/getSpecificWeather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final GetSpecificWeather getWeather;
  final GetLocationWeather getLocationWeather;
  final InputValidation inputValidation;
  final LocationValidator locationValidator;
  //final GetUserLocation getUserLocation;

  WeatherState get initialState => Empty();

  WeatherBloc({
    required this.getWeather,
    required this.getLocationWeather,
    required this.inputValidation,
    required this.locationValidator,
    //required this.getUserLocation,
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
        }, (weather) async => emit(Loaded(weather)));
      }
      );
    });

    on<GetWeatherBasedOnLocation>((event, emit) async {
      final lati = locationValidator.validateLatitude(event.latitude);
      final longi = locationValidator.validateLongitude(event.longitude);
      await lati.fold((failure) async {
        emit(const Error(message: 'Coordinates Error'));
      }, (latitudeDouble) async {
        emit(Loading());
        await longi.fold((failure) async {
          emit(const Error(message: 'Coordinates Error'));
        }, (longitudeDouble) async {
          emit(Loading());
          final failureOrWeather = await getLocationWeather(LParams(longitude: longitudeDouble, latitude: latitudeDouble));
          await failureOrWeather.fold((failure) async {
            emit(Error(message: _mapFailureToMessage(failure)));
          }, (weather) async {
            print(weather);
            emit(Loaded(weather));
          });
        });
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