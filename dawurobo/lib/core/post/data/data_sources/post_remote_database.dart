import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/post.dart';

/// Contracts for interacting with database
abstract class PostRemoteDatabase {
  /// Create and save post in remote database
  Future<Post> create(Post post);

  /// Get all [Post]s in remote database
  Future<List<Post>> retrieve();

  /// Get Specific [Post]s in remote database
  Future<Post> specificPost(String documentId);
}

class PostRemoteDatabaseImpl implements PostRemoteDatabase {
  @override
  Future<Post> create(Post post) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      // Add the document to Cloud Firestore.
      DocumentReference reference = await firestore.collection('posts').add(post.toJson());

      // Get the document ID.
      String documentId = reference.id;

      // Update the object with the document ID.
      post = post.copyWith(id: documentId);

      // Update the document with the ID field.
      await reference.update(post.toJson());

      return post;
    } on FirebaseException {
      return post;
    }
  }

  @override
  Future<List<Post>> retrieve() async {
    try{
      final result = (await FirebaseFirestore.instance.collection('posts').get())
        .docs
        .map((item) => Post.fromJson(item.data()))
        .toList();
      return result;
    }on FirebaseException {
      return [];
    }
  }

  @override
  Future<Post> specificPost(String documentId) async {
    final postMap = (await FirebaseFirestore.instance
        .collection('posts')
        .doc(documentId)
        .get());
    final results = postMap.data()!;
    return Post.fromJson(results);
  }
}
