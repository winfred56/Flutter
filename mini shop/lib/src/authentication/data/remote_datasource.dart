import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateUsers{
  // Instance of Firebase
  final FirebaseAuth _authenticator = FirebaseAuth.instance;

  /// Create a Stream to check changes in authentications( ie logged in or logged out)
  Stream<User?> getUser(){
    return _authenticator.authStateChanges();
  }

  /// Registration
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential results = await _authenticator.createUserWithEmailAndPassword(email: email, password: password);
      UserCredential user = results;
      print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Log In
  Future logInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential results = await _authenticator.signInWithEmailAndPassword(email: email, password: password);
      UserCredential user = results;
      //print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Sign Out
  Future logout()async{
    try {
      return await _authenticator.signOut();
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

}