import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class User with _$User {
  /// Constructor
  factory User({
    /// User's preferred username
    required  final String username,
    /// User's Full Name
    required final String fullName,
    /// Gender of the user
    required final String gender,
    /// User's email address
    required final String email,
    /// User's profile photo
    required final String profilePicture
  }) = _User;



  /// Converts Json to dart objects
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// initial data
  factory User.initial() =>
      User(
          username: '',
          fullName: '',
          gender: '',
          email: '',
          profilePicture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU');
}
