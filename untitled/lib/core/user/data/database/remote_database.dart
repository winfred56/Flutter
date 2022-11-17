import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user.dart';

abstract class UserRemoteDatabase {
  /// Contracts for interacting with database
  Future<User> signInPhone(User user);

  /// Updates a specific [User] instance
  Future<User> update(User user);
}

/// Implements [ProfileRemoteDatabase]
class UserRemoteDatabaseImpl extends UserRemoteDatabase {
  @override
  Future<User> signInPhone(User user) async {
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

  @override
  Future<User> update(User user) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(user.id)
        .update(user.toJson()..remove('date'));
    return user;
  }
}
