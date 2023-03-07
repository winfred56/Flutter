import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:knust_elect/src/signin/presentation/pages/signin_page.dart';

import 'firebase_options.dart';
import 'shared/data/hive_adapters.dart';
import 'shared/platform/push_notification.dart';
import 'shared/routes.dart';
import 'shared/themes/widget theme.dart';
import 'core/electorate/data/database/electorate_local_database.dart';
import 'injection_container.dart' as di;



Future<void> main() async {
  ///  keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await HiveAdapters.setUp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  final authState = await di.sl<ElectorateLocalDatabase>().authenticationStatus();
  await di.sl<PushNotification>().initializeNotification();
  await runZonedGuarded<Future<void>>(
        () async {
      runApp(DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: Routes.routes,
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              home: const SignInPage(),
              title: 'KNUST Elect',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system)));
      FlutterNativeSplash.remove();
    },
        (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)
  );
}
