import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../domain/entities/user.dart';

/// Contracts for interacting with database
abstract class UserRemoteDatabase {
  /// Creates [User] profile on firebase
  Future<User> createUser(User user);

  /// Updates a specific [User] instance
  Future<User> update(User user);

  /// Retrieve a [User] instance
  Future<User> retrieve(String documentID);

  /// Delete User Account
  Future<void> deleteAccount(String documentID);
}

/// Implements [ProfileRemoteDatabase]
class UserRemoteDatabaseImpl implements UserRemoteDatabase {
  /// Updates a specific [User] instance on Firebase
  @override
  Future<User> update(User user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .update(user.toJson()..remove('date'));
    return user;
  }

  /// Creates [User] profile on firebase
  @override
  Future<User> createUser(User user) async {
    try {
      final extra = {
        'date': FieldValue.serverTimestamp(),
        'profileType': 'user'
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toJson()..addAll(extra));
      return user;
    } on FirebaseException {
      return user;
    }
  }

  /// Retrieve a [User] instance from Firebase
  @override
  Future<User> retrieve(String documentID) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .doc(documentID)
        .get();
    return User.fromJson(result.data()!);
  }

  @override
  Future<void> deleteAccount(String documentID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(documentID)
        .delete()
        .then((_) async {
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.currentUser!.delete();
      }
      print('Account deleted successfully.');
    }).catchError((error) {
      print('Failed to delete document: $error');
    });
  }
}
