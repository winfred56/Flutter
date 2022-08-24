import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/candidate.dart';

/// Gets candidates from firebase firestore

Future<List<Candidate>> getAllCandidates() async {
  /// Create a CollectionReference called users
  /// that references the firestore collection

  return FirebaseFirestore.instance.collection('candidates').get().then((value) {
    /// Loop over documents in collection
    return value.docs
        .map(
          (document){
        return Candidate.fromJson(document.data());
      },
    ).toList();
  });
}
