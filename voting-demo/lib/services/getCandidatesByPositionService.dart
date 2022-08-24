import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_demo/models/position.dart';

import '../models/candidate.dart';

/// Gets candidates by position from firebase firestore

Future<List<Candidate>> getCandidatesByPosition(Position position) async {
  /// Create a CollectionReference called users
  /// that references the firestore collection

  return FirebaseFirestore.instance
      .collection('candidates')
      .where('position', isEqualTo: 'positions/${position.id}')
      .get()
      .then((value) {
    /// Loop over documents in collection
    return value.docs.map(
      (document) {
        return Candidate.fromJson(document.data());
      },
    ).toList();
  });
}
