import 'dart:async';
import 'package:dawurobo/src/authentication/presentation/pages/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:provider/provider.dart';

import 'package:dawurobo/shared/notifications/push_notifications.dart';
import 'package:dawurobo/src/authentication/presentation/pages/sign_in.dart';
import 'package:dawurobo/src/home/presentation/pages/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'injection_container.dart' as di;

AndroidNotificationChannel channel = const AndroidNotificationChannel(
    '', // id
    'Dawuro', // title
    importance: Importance.high,
    ledColor: Colors.green,
    enableLights: true,
    playSound: true);

Future<void> firebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('background message: ${message.messageId}');
  }
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await Firebase.initializeApp();
  await di.sl<PushNotification>().initializeNotification();
  FirebaseMessaging.onBackgroundMessage(
      (message) => firebaseMessagingBackground(message));
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  await runZonedGuarded<Future<void>>(
    () async {
      runApp(DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => StreamProvider<firebase_auth.User?>.value(
          value: firebase_auth.FirebaseAuth.instance.authStateChanges(),
          initialData: null,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            home: const Authenticate(),
            title: 'Dawurobo',
            themeMode: ThemeMode.system,
            //darkTheme: darkMode,
          ),
        ),
      ));
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}
