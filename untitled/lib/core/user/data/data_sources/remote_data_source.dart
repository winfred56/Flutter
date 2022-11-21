import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDatabase {
  /// Logs a user into the application with credentials
  Future<UserCredential> authLogin(String email, String password);
  /// Register a new user
  Future<UserCredential> authSignUp(String email, String password);
  /// Log a user out
  Future<UserCredential> authLogOut();
}

class UserRemoteDatabaseImpl implements UserRemoteDatabase{
  @override
  Future<UserCredential> authLogOut() async {
    final results =  await FirebaseAuth.instance.signOut();
    print(results as UserCredential);
    return results;
  }

  @override
  Future<UserCredential> authLogin(String email, String password) async {
    final results =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    print(results);
    return results;
  }

  @override
  Future<UserCredential> authSignUp(String email, String password) async {
    final results =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print(results);
    return results;
  }

}