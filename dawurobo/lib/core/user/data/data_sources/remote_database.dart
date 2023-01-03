import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user.dart';

/// Contracts for interacting with database
abstract class UserRemoteDatabase {
  /// Authenticates user account with phoneNumber
  Future<User> signIn(User user);

  /// Updates a specific [User] instance
  Future<User> update(User user);
}

/// Implements [ProfileRemoteDatabase]
class UserRemoteDatabaseImpl implements UserRemoteDatabase {
  @override
  Future<User> update(User profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .update(profile.toJson()..remove('date'));
    return profile;
  }

  @override
  Future<User> signIn(User user) async {
    try {
      final extra = {
        'date': FieldValue.serverTimestamp(),
        'profileType': 'user'
      };
      await FirebaseFirestore.instance
          .collection('profiles')
          .doc(user.id)
          .set(user.toJson()..addAll(extra));
      return user;
    } on FirebaseException {
      return user;
    }
  }
}
