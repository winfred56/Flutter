import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:music_reques_dj/shared/error/failure.dart';

import '../../../../shared/usecase/usecase.dart';
import '../entities/request.dart';
import '../repositories/request_repository.dart';

class UpdateRequest implements Usecase<Request, UpdateRequestParams> {
  /// Constructor
  UpdateRequest(this.repository);
  final RequestRepository repository;

  @override
  Future<Either<Failure, Request>> call(params) =>
      repository.update(params.request);
}

class UpdateRequestParams extends Equatable {
  /// Constructor
  const UpdateRequestParams(this.request);
  final Request request;

  @override
  List<Object?> get props => [request];
}
