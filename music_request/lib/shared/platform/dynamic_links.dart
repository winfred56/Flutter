import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';



Future<void> initializeDynamicLinks(BuildContext context) async {
  // Check if you received the link via `getInitialLink` first
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    final String? id = deepLink.pathSegments.isNotEmpty ? deepLink.pathSegments.last : null;
    if (id != null) {
      /// Navigate to Page
    }
  }

  FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicLinkData) {
    // Set up the `onLink` event listener next as it may be received here
    final Uri deepLink = pendingDynamicLinkData.link;
    final String? eventID = deepLink.queryParameters['link'];
    print('Event ID: $eventID');
    if (eventID != null) {
      /// Navigate to Page
    }
  });
}

