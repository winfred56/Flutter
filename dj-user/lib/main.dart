import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:dj_user/shared/theme/widget_theme.dart';
import 'package:flutter/material.dart';

import 'src/home/presentation/pages/home.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Future<void>(() async {
    runApp(DevicePreview(
        enabled: false, //!kReleaseMode,
        builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            home: const HomePage(),
            themeMode: ThemeMode.light,
            theme: CustomTheme.darkTheme,
            title: 'DJ-User')));
  });
}
