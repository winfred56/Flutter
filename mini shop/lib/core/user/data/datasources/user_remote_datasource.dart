import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/user.dart';

/// Contracts for interacting with remote database
abstract class UserRemoteDatasource {
  /// Register a new [User]
  Future<void> register(String email, String password);

  /// Sign in a specific [User]
  Future<void> signIn(String email, String password);

  /// Log Out a specific [User]
  Future<void> logOut();

}


class UserRemoteDatasourceImpl extends UserRemoteDatasource{
  // Create a FirebaseAuth instance
  firebase.FirebaseAuth auth = firebase.FirebaseAuth.instance;

  @override
  Future<void> logOut() async{
    await auth.signOut();
  }

  @override
  Future<void> register(String email, String password) async {
    try{
      final extra = {
        'date': FieldValue.serverTimestamp(),
      };
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(kDebugMode){
        print('Account Created, Now Adding Details to firestore...');
      }
      await FirebaseFirestore.instance.collection('users').add({
        'phoneNumber': '',
        'username': '',
        'email': email,
        'fullName': '',
      }).then((documentReference) {
        if(kDebugMode){
        print('Document ID: ${documentReference.id}');}
      });
    } catch (e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    // TODO: implement signIn
    throw UnimplementedError();
  }

}