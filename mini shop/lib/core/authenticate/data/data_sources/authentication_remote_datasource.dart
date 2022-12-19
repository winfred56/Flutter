import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationRemoteDatasource {
  /// Creates a new [User] in Firebase
  Future<void> create(String email, String password);

  /// Log In an existing [User] from Firebase
  Future<void> logIn(String email, String password);

  /// Log Out an existing [User]
  Future<void> logOut();

  /// Gets [User]'s Auth Changes
  Stream<User?> getUser();
}

class AuthenticationRemoteDatasourceImpl
    extends AuthenticationRemoteDatasource {

  /// create an Instance of the class FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> create(String email, String password) async {
    try {
      final results = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (kDebugMode) {
        print(results);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From create Method in AuthenticationRemoteDatasourceImpl --> authentication_remote_datasource');
        return;
      }
    }
  }

  @override
  Stream<User?> getUser() {
    final results = _auth.authStateChanges();
    if (kDebugMode) {
      print(results);
      print(_auth.currentUser);
    }
    return results;
  }

  @override
  Future<void> logIn(String email, String password) async {
    try {
      final results = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      if (kDebugMode) {
        print(results);
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From logIn Method in AuthenticationRemoteDatasourceImpl --> authentication_remote_datasource');
        return;
      }
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      if (kDebugMode) {
        print(error);
        print(
            'Error Coming From logOut Method in AuthenticationRemoteDatasourceImpl --> authentication_remote_datasource');
        return;
      }
    }
  }
}
