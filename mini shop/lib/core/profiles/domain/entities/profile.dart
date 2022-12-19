// flutter packages run build_runner build --delete-conflicting-outputs
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  /// Constructor
  factory Profile({
    ///  Firebase documentID -> [id]
    required String id,

    /// Phone number for signIn
    required String phoneNumber,

    /// Firebase user.displayName -> Username
    required String username,

    /// Email associated to the profile
    required String email,

    /// Full name associated to the user
    required String name,

    /// Profile Picture
    required String photo,

    /// date
    required String dateJoined
  }) = _Profile;

  /// Converts json to dart object
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);


  /// Initial User dummy data
  factory Profile.initial() => Profile(
    id: '',
    phoneNumber: '',
    username: '',
    email: '',
    name: '',
    photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
    dateJoined: ''
  );
}
