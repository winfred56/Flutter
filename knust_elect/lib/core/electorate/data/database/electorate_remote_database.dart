import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../domain/entities/electorate.dart';

/// Contracts for interacting with database
abstract class ElectorateRemoteDatabase {
  /// Authenticates [Electorate] account with phoneNumber
  Future<Electorate> signIn(Electorate user);

  /// Updates a specific [Electorate] instance
  Future<Electorate> update(Electorate electorate);

  Future<void> verifyEmail();
}

/// Implements [ProfileRemoteDatabase]
class ElectorateRemoteDatabaseImpl implements ElectorateRemoteDatabase {
  @override
  Future<Electorate> update(Electorate profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .update(profile.toJson()..remove('date'));
    return profile;
  }

  @override
  Future<Electorate> signIn(Electorate electorate) async {
    try {
      final extra = {
        'date': FieldValue.serverTimestamp(),
        'profileType': 'electorate'
      };
      await FirebaseFirestore.instance
          .collection('profiles')
          .doc(electorate.id)
          .set(electorate.toJson()..addAll(extra));
      return electorate;
    } on FirebaseException {
      return electorate;
    }
  }

  @override
  Future<void> verifyEmail() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser != null && currentUser.email != null && currentUser.emailVerified == false){
        if(currentUser.emailVerified ){
          return;
        }
        await currentUser.sendEmailVerification();
      }
    } on Exception {
      return;
    }
  }


}
