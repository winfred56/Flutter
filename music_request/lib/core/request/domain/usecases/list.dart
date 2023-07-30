import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/request.dart';
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
