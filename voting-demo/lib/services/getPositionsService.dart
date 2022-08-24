import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/position.dart';

/// Gets candidates from firebase firestore

Future<List<Position>> getAllPositions() async {
  /// Create a CollectionReference called users
  /// that references the firestore collection

  return FirebaseFirestore.instance.collection('positions').get().then((value) {
    /// Loop over documents in collection
    return value.docs
        .map(
          (document){
        return Position.fromJson(document.data());
      },
    ).toList();
  });
}
