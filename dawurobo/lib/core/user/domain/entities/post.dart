import 'package:freezed_annotation/freezed_annotation.dart';


part 'post.freezed.dart';

part 'post.g.dart';



// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Post with _$Post{
  /// Constructor
  factory Post({
    ///  Firebase documentID -> [id]
    required String id,

    /// Post details
    required String message,

    /// Date posted
    required DateTime date,

  }) = _Post;

  /// Converts json to dart object
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// Initial Post dummy data
  factory Post.initial() => Post(id: '', message: '', date: DateTime.now());
}