import 'package:dartz/dartz.dart';
import 'package:music_request/core/request/domain/entities/song.dart';
import 'package:music_request/core/request/domain/repositories/request_repository.dart';
import 'package:music_request/shared/error/failure.dart';
import 'package:music_request/shared/usecase/usecase.dart';

class SearchSong implements Usecase<Song ,StringParams>{
  /// Constructor
  SearchSong(this.repository);
  final RequestRepository repository;

  @override
  Future<Either<Failure, Song>> call(StringParams params) => params.value;
}