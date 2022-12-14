import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../src/device/domain/entities/device.dart';
import '../error/exception.dart';

/// Ask for push notification in mobile app
abstract class PushNotification {
  /// Returns firebase token of the device for cloud messaging
  /// Other mobile device information are also gathered
  Future<Device> deviceDetails();

  /// Initialize local notification
  Future<void> initializeNotification();
}

/// Implements [PushNotification]
class PushNotificationImpl implements PushNotification {
  /// Constructor
  PushNotificationImpl(this.localNotification);

  /// local notification plugin
  final FlutterLocalNotificationsPlugin localNotification;


  Future<void> firebaseMessagingBackground(RemoteMessage message)async {
    await Firebase.initializeApp();
    if (kDebugMode) {
      print('background message: ${message.messageId}');
    }
  }


  @override
  Future<Device> deviceDetails() async {
    final permission = await FirebaseMessaging.instance.requestPermission();
    if (permission.authorizationStatus != AuthorizationStatus.authorized) {
      throw DeviceException(
          'Notification error🔔.\nEnable notification permission.');
    }
    final token = await FirebaseMessaging.instance.getToken();
    return Device(
        localName: Platform.localeName,
        operatingSystemVersion: Platform.operatingSystemVersion,
        fcmToken: token!,
        operatingSystem: Platform.operatingSystem,
        localHostName: Platform.localHostname);
  }

  @override
  Future<void> initializeNotification() async {
    const initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings());
    await localNotification.initialize(initializationSettings);

    const channel = AndroidNotificationChannel(
      '', // id
      'Dawuro', // title
      importance: Importance.high,
      ledColor: Colors.green,
      enableLights: true,
      playSound: true
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
      if (notification != null && android != null) {
        localNotification.show(
          message.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            ),
          ),
        );
      }
    });
  }
}
