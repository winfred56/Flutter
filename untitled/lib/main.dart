import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

Future<void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      //home: const PhonePage(),
    ),)
      );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: 'Flutter Demo',
//   //     theme: ThemeData(
//   //       primarySwatch: Colors.blue,
//   //     ),
//   //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
//   //   );
//   // }
// }

