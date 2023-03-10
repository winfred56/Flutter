import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../polls/domain/entities/polls.dart';

part 'candidate.freezed.dart';

part 'candidate.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Candidate with _$Candidate {
  /// Constructor
  factory Candidate({
    ///  Firebase documentID -> [id]
    required String id,

    /// Full name associated to the [Candidate]
    required String name,

    /// Aspiring Poll of the [Candidate]
    required Polls position,

    /// Full name associated to the [Candidate]
    required int votes,

    /// Profile image associated to the [Candidate]
    required String photo,
  }) = _Candidate;

  const Candidate._();

  @override
  String toString() => id.substring(0, 3);

  /// Converts json to dart object
  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  /// Initial User dummy data
  factory Candidate.initial() => Candidate(
      id: '',
      position: Polls.initial(),
      name: '',
      photo:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
      votes: 0);
}
