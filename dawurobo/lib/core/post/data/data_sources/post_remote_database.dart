import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/post.dart';

/// Contracts for interacting with database
abstract class PostRemoteDatabase {
  /// Create and save post in remote database
  Future<Post> create(Post post);
}

class PostRemoteDatabaseImpl implements PostRemoteDatabase {
  @override
  Future<Post> create(Post post) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .add(post.toJson());
      return post;
    } on FirebaseException {
      return post;
    }
  }
}
