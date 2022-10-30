import 'package:flutter/material.dart';
import 'package:weather_app_cc/core/location/getCurrentLocation.dart';
import 'injection_container.dart' as di;

import 'features/weather/presentation/pages/weather_page.dart';

Future<void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  GetUserLocation;
  print('$GetUserLocation ---from main');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherPage(),
    );
  }
}

