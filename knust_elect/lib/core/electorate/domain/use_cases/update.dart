import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:knust_elect/core/electorate/domain/entities/electorate.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../repositories/electorate_repository.dart';

/// Updates a [Electorate] instance
class UpdateElectorate extends Usecase<Electorate, UpdateElectorateParams> {
  /// Constructor
  UpdateElectorate(this.repository);

  /// Repository
  final ElectorateRepository repository;

  @override
  Future<Either<Failure, Electorate>> call(UpdateElectorateParams params) =>
      repository.update(params.electorate);
}

class UpdateElectorateParams extends Equatable {
  /// Constructor
  const UpdateElectorateParams(this.electorate);

  /// Params
  final Electorate electorate;

  @override
  List<Object> get props => [electorate];
}
