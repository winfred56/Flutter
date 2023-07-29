import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:music_reques_dj/src/library/library_injection.dart';

import 'core/requests/request_injection.dart';
import 'core/user/user_injection.dart';
import 'shared/network/network.dart';
import 'shared/platform/push_notification.dart';
import 'src/authentication/authentication_injection.dart';
import 'src/home/home_injection.dart';

/// Instantiate GetIT
final sl = GetIt.instance;

void init() {
  /// User
  initUser();

  /// Authentication
  initAuthentication();

  /// Home
  initHome();

  ///  Requests
  initRequest();

  /// Library
  initLibrary();

  /// Shared - repositories
  sl

    /// Checks Internet Connectivity
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new)

    /// Init Local Caching
    ..registerLazySingleton<HiveInterface>(() => Hive)

    /// Init Firebase Messaging
    ..registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance)

    /// http package
    ..registerLazySingleton(http.Client.new)

    /// Init Push Notification
    ..registerFactory<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin.new)
    ..registerLazySingleton<PushNotification>(() => PushNotificationImpl(sl()));
}
