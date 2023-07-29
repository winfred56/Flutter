import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/utils/converter.dart';
import '../../../user/domain/entities/user.dart';
import 'song.dart';

part 'request.freezed.dart';

part 'request.g.dart';

/// dart run build_runner build --delete-conflicting-outputs
@freezed
class Request with _$Request {
  @JsonSerializable(explicitToJson: true)
  factory Request(
      {required String id,
      required Song song,
      required User user,
      required User dj,
      required Status status,
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required String date}) = _Request;

  /// Converts json to dart object
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// String representation
  @override
  String toString() => id;

  /// Initial State of Entity
  factory Request.initial() => Request(
        id: '',
        song: Song.initial(),
        user: User.initial(),
        dj: User.initial(),
        status: Status.pending,
        date: DateTime.now().toString(),
      );
}

enum Status { pending, accepted, declined }
