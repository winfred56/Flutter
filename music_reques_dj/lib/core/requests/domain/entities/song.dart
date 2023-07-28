import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

part 'song.g.dart';

/// dart run build_runner build --delete-conflicting-outputs
@freezed
class Song with _$Song {
  @JsonSerializable(explicitToJson: true)
  factory Song(
      {required String artistName,
      required String songName,
      required String songImage}) = _Song;

  /// Converts json to dart object
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  /// Initial State of Entity
  factory Song.initial() => Song(artistName: '', songName: '', songImage: '');
}
