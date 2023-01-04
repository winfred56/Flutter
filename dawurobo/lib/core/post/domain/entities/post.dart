import 'package:freezed_annotation/freezed_annotation.dart';


part 'post.g.dart';
part 'post.freezed.dart';

@freezed
class Post with _$Post {
  factory Post({
    /// Post ID
    required String id,

    /// Owner of a particular post
    required String author,

    /// Actual Post message
    required String postText,

    /// Likes
    required int likes,
  }) = _Post;

  /// Converts json to dart object
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// Initial Dummy data
  factory Post.initial() =>
      Post(id: '', author: '', postText: 'postText', likes: 0);
}
