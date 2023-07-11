import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/device.dart';
import '../repositories/device_repository.dart';

/// Get a lst of user devices
class ListDevices implements Usecase<List<Device>, ListStringParams> {
  /// Constructor
  ListDevices(this.repository);

  /// Repository
  final DeviceRepository repository;

  @override
  Future<Either<Failure, List<Device>>> call(ListStringParams params) =>
      repository.list(params.values);
}
