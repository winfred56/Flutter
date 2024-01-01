import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'shared/presentation/theme.dart';
import 'src/onboarding/presentation/pages/onboarding.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(54,32,93, 1), // Set the desired color here
  ));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future<void>(() async {
    runApp(
        MaterialApp(
            debugShowCheckedModeBanner: !kReleaseMode,
            home: const OnboardingPage(),
          theme: lightTheme,
        )
    );
    FlutterNativeSplash.remove();
  });
}

