import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_reques_dj/core/requests/domain/entities/request.dart';

abstract class RequestRemoteDatabase {
  /// List of all requests
  Stream<List<Request>> list(String djID);

  /// Update request
  Future<Request> update(Request request);
}

class RequestRemoteDatabaseImpl implements RequestRemoteDatabase {
  @override
  Stream<List<Request>> list(String djID) async* {
    yield* FirebaseFirestore.instance
        .collection('requests')
        .orderBy('date', descending: true)
        .snapshots()
        .map((request) => request.docs
            .where((requestDoc) => (requestDoc.data()['dj']['id']) == (djID))
            .map<Request>((event) => Request.fromJson(event.data()))
            .toList());
  }

  @override
  update(Request request) async {
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(request.id)
        .update(request.toJson());
    return request;
  }
}
