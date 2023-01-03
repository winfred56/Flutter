import 'package:dawurobo/shared/notifications/push_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import 'core/user/user_injection.dart';
import 'shared/network/network.dart';

import 'src/device/device_injection.dart';


/// Instantiate GetIT
final sl = GetIt.instance;

Future<void> init() async {

  /// Device
  initDevice();

  /// User
  initUser();


  /// Shared - repositories
  sl

  /// Checks Internet Connectivity
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new)

  /// Init Firebase Messaging
    ..registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance)

  /// http package
    ..registerLazySingleton(http.Client.new);

  final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);


  /// Init Push Notification
    sl.registerFactory<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin.new);
    sl.registerLazySingleton<PushNotification>(() => PushNotificationImpl(sl()));
}
