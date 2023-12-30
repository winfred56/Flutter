import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'shared/presentation/theme.dart';
import 'src/onboarding/presentation/pages/onboarding.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future<void>(() async {
    runApp(
        MaterialApp(
            debugShowCheckedModeBanner: kReleaseMode,
            home: const OnboardingPage(),
          theme: lightTheme,
        )
    );
    FlutterNativeSplash.remove();
  });
}

