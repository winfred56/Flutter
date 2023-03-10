import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knust_elect/core/candidate/domain/entities/candidate.dart';

part 'polls.freezed.dart';

part 'polls.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Polls with _$Polls {
  /// Constructor
  factory Polls({
    ///  Firebase documentID -> [id]
    required String id,

    /// List of aspiring candidates of the associated [Polls]
    required List<Candidate> candidates,

    /// Profile image associated to the [Polls]
    required String photo,
  }) = _Polls;

  const Polls._();

  @override
  String toString() => id.substring(0, 2);

  /// Converts json to dart object
  factory Polls.fromJson(Map<String, dynamic> json) =>
      _$PollsFromJson(json);

  /// Initial User dummy data
  factory Polls.initial() => Polls(
      id: '',
      candidates: [],
      photo:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU');
}
