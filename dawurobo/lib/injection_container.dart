import 'package:dawurobo/shared/notifications/push_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


import 'shared/network/network.dart';

import 'src/device/device_injection.dart';


/// Instantiate GetIT
final sl = GetIt.instance;

void init() {

  /// Device
  initDevice();


  /// Shared - repositories
  sl

  /// Checks Internet Connectivity
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new)

  /// Init Firebase Messaging
    ..registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance)

  /// http package
    ..registerLazySingleton(http.Client.new)

  /// Init Push Notification
    ..registerFactory<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin.new)
    ..registerLazySingleton<PushNotification>(() => PushNotificationImpl(sl()));
}
