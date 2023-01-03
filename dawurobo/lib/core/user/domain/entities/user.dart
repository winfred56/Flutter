import 'package:dawurobo/core/user/domain/entities/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class User with _$User {
  /// Constructor
  factory User(
      {

      ///  Firebase documentID -> [id]
      required String id,

      /// Firebase user.displayName -> Username
      required String username,

      /// Email associated to the user
      required String email,

      /// Full name associated to the user
      required String fullName,

      /// Profile image associated to the user
      required String photo,

      /// Posts associated to the user
      required List<Post> posts}) = _User;

  /// Converts json to dart object
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Initial User dummy data
  factory User.initial() => User(
        id: '',
        username: '',
        email: '',
        fullName: '',
        photo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
        posts: [],
      );
}
