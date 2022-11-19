import 'package:firebase_auth/firebase_auth.dart';

/// Contracts for interacting with database
abstract class UserRemoteDatabase {
  /// Authenticates user account with credentials
  Future<UserCredential> login(String email, String password);

  /// Registers a [User] with credentials
  Future<UserCredential> signup(String email, String password);

  /// Logs a [User] out
  Future<User?> logout(User user);
}

class UserRemoteDatabaseImpl extends UserRemoteDatabase {
  @override
  Future<UserCredential> login(String email, String password) async {
    final results = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return results;
  }

  @override
  Future<User?> logout(User user) async {
    return null;
  }

  @override
  Future<UserCredential> signup(String email, String password) async {
    final result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return result;
  }
}
