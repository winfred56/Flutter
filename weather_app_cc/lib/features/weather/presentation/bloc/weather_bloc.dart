import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_cc/core/errors/failures.dart';
import 'package:weather_app_cc/core/utils/input_validations.dart';

import '../../domain/entities/weather.dart';
import '../../domain/use_cases/getWeather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final GetWeather getWeather;
  final InputValidation inputValidation;

  WeatherState get initialState => Empty();

  WeatherBloc({
    required this.getWeather,
    required this.inputValidation,
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
  }

  // Stream<WeatherState> mapEventToState(
  //     WeatherEvent event,
  //     ) async* {
  //   if (event is GetWeatherForCity) {
  //     final inputEither =
  //     inputValidation.checkString(event.city);
  //
  //     yield* inputEither.fold(
  //           (failure) async* {
  //         yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
  //       },
  //           (string) async* {
  //         yield Loading();
  //         final failureOrTrivia = await getWeather(
  //           Params(city: string),
  //         );
  //         yield failureOrTrivia.fold(
  //               (failure) => Error(message: _mapFailureToMessage(failure)),
  //               (weather) => Loaded(weather),
  //         );
  //       },
  //     );
  //   }
  // }

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