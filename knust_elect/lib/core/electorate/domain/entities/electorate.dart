import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/data/hive_adapters.dart';

part 'electorate.freezed.dart';

part 'electorate.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@HiveType(typeId: HiveAdapters.electorate)
@freezed
class Electorate with _$Electorate {
  /// Constructor
  factory Electorate({
    ///  Firebase documentID -> [id]
    @HiveField(0) required String id,

    /// Phone number for signIn
    @HiveField(1) required String phoneNumber,

    /// Firebase user.displayName -> Username
    @HiveField(2) required String username,

    /// Email associated to the user
    @HiveField(3) required String email,

    /// Full name associated to the user
    @HiveField(4) required String name,

    /// Profile image associated to the user
    @HiveField(5) required String photo,
  }) = _Electorate;

  const Electorate._();

  @override
  String toString() => id.substring(0, 5);

  /// Converts json to dart object
  factory Electorate.fromJson(Map<String, dynamic> json) => _$ElectorateFromJson(json);

  /// Initial User dummy data
  factory Electorate.initial() => Electorate(
      id: '',
      phoneNumber: '',
      username: '',
      email: '',
      name: '',
      photo:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU');
}
