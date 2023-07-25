import 'package:dartz/dartz.dart';
import 'package:music_request/core/request/domain/entities/request.dart';
import 'package:music_request/core/request/domain/entities/song.dart';

import '../../../../shared/error/failure.dart';

abstract class RequestRepository{
  /// make a request
  Future<Either<Failure, Request>> sendRequest(Request request);

  /// Search for a song
  Future<Either<Failure, Song>> search(String songTitle);
}
