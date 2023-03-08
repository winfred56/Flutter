import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/data/hive_adapters.dart';

part 'student.freezed.dart';

part 'student.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@HiveType(typeId: HiveAdapters.student)
@freezed
class Student with _$Student {
  /// Constructor
  factory Student({
    ///  Firebase documentID -> [id]
    @HiveField(0) required String id,

    /// Phone number for signIn
    @HiveField(1) required String phoneNumber,

    /// Firebase user.displayName -> Username
    @HiveField(2) required String username,

    /// Email associated to the student
    @HiveField(3) required String email,

    /// Full name associated to the student
    @HiveField(4) required String name,

    /// Full name associated to the student
    @HiveField(5) required bool voted,

    /// Profile image associated to the student
    @HiveField(6) required String photo,
  }) = _Student;

  const Student._();

  @override
  String toString() => id.substring(0, 5);

  /// Converts json to dart object
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  /// Initial User dummy data
  factory Student.initial() => Student(
      id: '',
      phoneNumber: '',
      username: '',
      email: '',
      name: '',
      photo:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
      voted: false);
}
