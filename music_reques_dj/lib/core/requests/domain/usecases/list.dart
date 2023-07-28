import 'package:dartz/dartz.dart';
import 'package:music_reques_dj/core/requests/domain/entities/request.dart';
import 'package:music_reques_dj/shared/error/failure.dart';
import 'package:music_reques_dj/shared/usecase/usecase.dart';

import '../repositories/request_repository.dart';

class ListRequests implements Usecase<Stream<List<Request>>, StringParams> {
  /// Constructor
  ListRequests(this.repository);

  /// Repository
  final RequestRepository repository;

  @override
  Future<Either<Failure, Stream<List<Request>>>> call(StringParams params) =>
      repository.list(params.value);
}
