// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  String get artistName => throw _privateConstructorUsedError;
  String get songName => throw _privateConstructorUsedError;
  String get songImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call({String artistName, String songName, String songImage});
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? songName = null,
    Object? songImage = null,
  }) {
    return _then(_value.copyWith(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      songImage: null == songImage
          ? _value.songImage
          : songImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String artistName, String songName, String songImage});
}

/// @nodoc
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res, _$_Song>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artistName = null,
    Object? songName = null,
    Object? songImage = null,
  }) {
    return _then(_$_Song(
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      songName: null == songName
          ? _value.songName
          : songName // ignore: cast_nullable_to_non_nullable
              as String,
      songImage: null == songImage
          ? _value.songImage
          : songImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Song implements _Song {
  _$_Song(
      {required this.artistName,
      required this.songName,
      required this.songImage});

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  final String artistName;
  @override
  final String songName;
  @override
  final String songImage;

  @override
  String toString() {
    return 'Song(artistName: $artistName, songName: $songName, songImage: $songImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.songName, songName) ||
                other.songName == songName) &&
            (identical(other.songImage, songImage) ||
                other.songImage == songImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, artistName, songName, songImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(
      this,
    );
  }
}

abstract class _Song implements Song {
  factory _Song(
      {required final String artistName,
      required final String songName,
      required final String songImage}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get artistName;
  @override
  String get songName;
  @override
  String get songImage;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
