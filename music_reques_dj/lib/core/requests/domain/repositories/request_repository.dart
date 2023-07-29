import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/request.dart';

abstract class RequestRepository {
  /// Retrieves all requests for a given dj
  Future<Either<Failure, Stream<List<Request>>>> list(String djID);

  /// Update a request
  Future<Either<Failure, Request>> update(Request request);
}
