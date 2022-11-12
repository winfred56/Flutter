import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cc/features/weather/domain/entities/weather.dart';
import 'package:weather_app_cc/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../../injection_container.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App ☁"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => sl<WeatherBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is Empty) {
                  return const MessageDisplay(
                    message: "No weather",
                  );
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is Loaded) {
                  return WeatherDisplay(weather: state.weather);
                } else if (state is Error) {
                  return MessageDisplay(message: state.message);
                } else {
                  return const MessageDisplay(message: 'Error');
                }
              }),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child:  WeatherControl(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Third of the size of the screen
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          // Fixed size, doesn't scroll
          Text(
            weather.name,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Expanded makes it fill in all the remaining space
          Expanded(
            child: Center(
              // Only the trivia "message" part will be scrollable
              child: SingleChildScrollView(
                child: Text(
                  '${weather.name} = ${weather.base}',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WeatherControl extends StatefulWidget {
  const WeatherControl({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherControl> createState() => _WeatherControlState();
}


class _WeatherControlState extends State<WeatherControl> {
  final controller = TextEditingController();
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a city',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            searchCity();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: searchCity,
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: locationWeather,
                child: const Text('current location'),
              ),
            ),
          ],
        )
      ],
    );
  }

  void searchCity() {
    controller.clear();
    context.read<WeatherBloc>().add(GetWeatherForCity(inputStr));
  }
  void locationWeather() {
    controller.clear();
    context.read<WeatherBloc>().add(GetWeatherForLocation());
  }
}
