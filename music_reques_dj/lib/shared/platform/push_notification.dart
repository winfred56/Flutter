import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../error/exception.dart';

/// Ask for push notification in mobile app
abstract class PushNotification {
  /// Returns firebase token of the device for cloud messaging
  /// Other mobile device information are also gathered
  Future<String> fcmToken();

  /// Initialize local notification
  Future<void> initializeNotification();

  /// Send Local Notification
  Future<void> sendLocalNotification(String notificationMessage, String title);
}

/// Implements [PushNotification]
class PushNotificationImpl implements PushNotification {
  /// Constructor
  PushNotificationImpl(this.localNotification);

  /// local notification plugin
  final FlutterLocalNotificationsPlugin localNotification;

  @override
  Future<String> fcmToken() async {
    final permission = await FirebaseMessaging.instance.requestPermission();
    if (permission.authorizationStatus != AuthorizationStatus.authorized) {
      throw DeviceException(
          'Notification error🔔.\nEnable notification permission.');
    }
    final token = await FirebaseMessaging.instance.getToken();
    return token ?? '';
  }

  @override
  Future<void> initializeNotification() async {
    const initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings());
    await localNotification.initialize(initializationSettings);

    const channel = AndroidNotificationChannel(
      'com.ecclesia.app', // id
      'Ecclesia', // title
      importance: Importance.high,
      ledColor: Colors.green,
      enableLights: true,
    );

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final android = message.notification?.android;
      final ios = message.notification?.apple;
      if (notification != null && android != null) {
        localNotification.show(
            message.hashCode,
            message.notification!.title,
            message.notification!.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            )));
      }
      if (notification != null && ios != null) {
        localNotification.show(
            message.hashCode,
            message.notification!.title,
            message.notification!.body,
            const NotificationDetails(iOS: DarwinNotificationDetails()));
      }
    });
  }

  @override
  Future<void> sendLocalNotification(String notificationMessage, String title) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings);

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        styleInformation: BigTextStyleInformation(notificationMessage,
            contentTitle: title,
            htmlFormatBigText: true,
            htmlFormatContentTitle: true));
    const iOSDetails = DarwinNotificationDetails();
    NotificationDetails platformChannelDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    flutterLocalNotificationsPlugin.show(0, title,
        notificationMessage, platformChannelDetails);
  }
}
