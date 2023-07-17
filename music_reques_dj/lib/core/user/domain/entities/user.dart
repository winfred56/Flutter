import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/data/hive_adapters.dart';
import '../../../../shared/utils/converter.dart';

part 'user.freezed.dart';

part 'user.g.dart';

/// dart run build_runner build --delete-conflicting-outputs
@HiveType(typeId: HiveAdapters.user)
@freezed
class User with _$User {
  /// Constructor
  factory User({
    ///  Firebase documentID -> [id]
    @HiveField(0) required String id,

    /// Phone number for signIn
    @HiveField(1) required String phoneNumber,

    /// Firebase user.displayName -> Username
    @HiveField(2) required String username,

    /// Email associated to the user
    @HiveField(3) required String email,

    /// Full name associated to the user
    @HiveField(4) required String fullName,

    /// Profile image associated to the user
    @HiveField(5) required String photo,

    /// Profile image associated to the user
    @HiveField(6) required String fcmToken,

    /// User's Date of Birth
    @JsonKey(
        readValue: JsonConverterWrapper.dateOfBirth,
        toJson: JsonConverterWrapper.toJson)
    @HiveField(7)
    required String dateOfBirth,
  }) = _User;

  const User._();

  @override
  String toString() => id.substring(0, 5);

  /// Converts json to dart object
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Initial User dummy data
  factory User.initial() => User(
      id: '',
      phoneNumber: '',
      username: '',
      email: '',
      fullName: '',
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
      dateOfBirth: DateTime(2010).toString(),
      fcmToken: '');
}
