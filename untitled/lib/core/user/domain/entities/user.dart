import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class CustomUser with _$CustomUser {
  /// Constructor
  factory CustomUser({
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
  }) = _CustomUser;



  /// Converts Json to dart objects
  factory CustomUser.fromJson(Map<String, dynamic> json) => _$CustomUserFromJson(json);

  /// initial data
  factory CustomUser.initial() =>
      CustomUser(
          username: '',
          fullName: '',
          gender: '',
          email: '',
          profilePicture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU');
}
