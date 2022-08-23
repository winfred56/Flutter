/// This class is responsible for Firebase authentications
/// Creates a user in Firebase and also gets user details from Firebase

import 'package:firebase_auth/firebase_auth.dart';

/// Create an instance of firebase

class Authentications{
  /// Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Create a Stream to check changes in authentications( ie login and logout)
  Stream<User?> getUser(){
    return _auth.authStateChanges();
  }

  /// Registration
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential results = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserCredential user = results;
      //print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Sign In
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential results = await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserCredential user = results;
      //print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Sign Out
  Future signOut()async{
    try {
      return await _auth.signOut();
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}