import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:music_request/core/request/domain/entities/request.dart';
import 'package:music_request/shared/error/failure.dart';
import 'package:music_request/shared/usecase/usecase.dart';

import '../repositories/request_repository.dart';

class SendSongRequest implements Usecase<Request, SendSongRequestParams> {
  /// Constructor
  SendSongRequest(this.repository);

  /// Repository
  final RequestRepository repository;

  @override
  Future<Either<Failure, Request>> call(SendSongRequestParams params) =>
      repository.sendRequest(params.request);
}

class SendSongRequestParams extends Equatable {
  /// Constructor
  const SendSongRequestParams(this.request);
  final Request request;

  @override
  List<Object?> get props => [request];
}
