import 'package:freezed_annotation/freezed_annotation.dart';


part 'user.freezed.dart';

part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class User with _$User {
  /// Constructor
  factory User({
    ///  Firebase documentID -> [id]
    required String id,

    /// Phone number for signIn
    required String phoneNumber,

    /// Firebase user.displayName -> Username
    required String username,

    /// Email associated to the user
    required String email,

    /// Full name associated to the user
    required String fullName,
  }) = _User;

  /// Converts json to dart object
  factory User.fromJson(Map<String, dynamic> json ) => _$UserFromJson(json);

  /// Initial User dummy data
  factory User.initial() =>
      User(id: '', phoneNumber: '', username: '', email: '', fullName: '');
}
