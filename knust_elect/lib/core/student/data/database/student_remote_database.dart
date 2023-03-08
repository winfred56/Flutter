import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../domain/entities/student.dart';

/// Contracts for interacting with database
abstract class StudentRemoteDatabase {
  /// Authenticates [Student] account with phoneNumber
  Future<Student> signIn(Student user);

  /// Updates a specific [Student] instance
  Future<Student> update(Student student);

  Future<void> verifyEmail();
}

/// Implements [ProfileRemoteDatabase]
class StudentRemoteDatabaseImpl implements StudentRemoteDatabase {
  @override
  Future<Student> update(Student profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .update(profile.toJson()..remove('date'));
    return profile;
  }

  @override
  Future<Student> signIn(Student student) async {
    try {
      final extra = {
        'date': FieldValue.serverTimestamp(),
        'profileType': 'student'
      };
      await FirebaseFirestore.instance
          .collection('students')
          .doc(student.id)
          .set(student.toJson()..addAll(extra));
      return student;
    } on FirebaseException {
      return student;
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
