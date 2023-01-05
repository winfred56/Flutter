import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../../../../core/post/presentation/pages/post_detail.dart';


abstract class ShareRemoteDatabase{
  Future<String> createDynamicLink(String documentID);
 // Future<void> initializeDynamicLink();
}

class ShareRemoteDatabaseImpl implements ShareRemoteDatabase{
  @override
  Future<String> createDynamicLink(String documentID) async {
    String url = 'https://com.example.dawurobo';
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("$url/$documentID"),
      uriPrefix: "https://dawurbo.page.link",
      androidParameters: const AndroidParameters(
        packageName: "com.example.dawurobo",
        minimumVersion: 0,
      ),

    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    return dynamicLink.toString();
  }

  static Future initializeDynamicLink(context) async {
    FirebaseDynamicLinks.instance.onLink.listen((event) async {
      final Uri deeplink = event.link;
      final id = deeplink.queryParameters['id'];
     await Navigator.push(context, MaterialPageRoute(builder: (context)=> PostDetails(postId: id ?? '')));
    });

    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    try{
      final Uri? deepLink = data?.link;
        String? id = deepLink?.queryParameters['id']!;
      return PostDetails(postId: id ?? '');
    }catch(e){
      print('No deepLink found');
    }
  }
}