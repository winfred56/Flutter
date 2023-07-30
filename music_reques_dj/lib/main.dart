import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'shared/theme/widget_theme.dart';
import 'src/home/presentation/pages/home.dart';
import 'core/user/data/database/user_local_database.dart';
import 'firebase_options.dart';
import 'shared/data/hive_adapters.dart';
import 'shared/platform/push_notification.dart';
import 'src/onboarding/presentation/pages/onboarding.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await HiveAdapters.setUp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  final authState = await di.sl<UserLocalDatabase>().authenticationStatus();
  await di.sl<PushNotification>().initializeNotification();
  await Future<void>(() async {
    runApp(DevicePreview(
        enabled: false, //!kReleaseMode,
        builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            home: authState ? const HomePage() : OnboardingPage(),
            // themeMode: ThemeMode.light,
            theme: CustomTheme.darkTheme,
            title: 'DJ')));
  });
}
