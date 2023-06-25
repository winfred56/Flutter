import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'src/authentication/presentation/pages/onboarding.dart';
import 'src/home/presentation/pages/home.dart';
import 'shared/theme/widget_theme.dart';


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
            home: const OnboardingPage(),
            themeMode: ThemeMode.dark,
            theme: CustomTheme.darkTheme,
            title: 'DJ-User')));
  });
}
