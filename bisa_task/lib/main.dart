import 'package:bisa_task/src/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const MyApp());
  await Future<void>(() async {
    runApp(DevicePreview(
        enabled: false, //!kReleaseMode,
        builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            // useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            home: WordSearchGame(), //const HomePage(),

            themeMode: ThemeMode.light,
            // theme: CustomTheme.darkTheme,
            title: 'BisaTask')));
  });
}
