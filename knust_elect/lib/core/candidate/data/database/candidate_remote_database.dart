import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/candidate.dart';

abstract class CandidateRemoteDatabase {
  /// Retrieve a [Candidate] instance
  Future<Candidate> retrieve(String documentID);
}

class CandidateRemoteDatabaseImpl implements CandidateRemoteDatabase {
  @override
  Future<Candidate> retrieve(String documentID) async {
    final result = await FirebaseFirestore.instance
        .collection('candidates')
        .doc(documentID)
        .get();
    return Candidate.fromJson(result.data()!);
  }
}
