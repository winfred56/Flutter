import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_demo/models/vote.dart';

import '../models/candidate.dart';

/// Gets a candidates votes and update

Future<void> voteForCandidate(Candidate candidate) async {
  /// Reference [Votes] collection
  final vote = await FirebaseFirestore.instance
      .collection('votes')
      .doc(candidate.id)
      .get();

  if(!vote.exists){}

  /// Convert vote to Dart
  var updatedVote = Vote.fromJson(vote.data()!);

  /// Update Vote
  updatedVote.votes += 1;

  /// Send Vote back to firestore
  await FirebaseFirestore.instance.collection('votes').doc(candidate.id).update({
    'votes': updatedVote.votes
  });
}
