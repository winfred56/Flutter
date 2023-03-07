import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/device.dart';
import '../repositories/device_repository.dart';

/// Get a device details
class RetrieveDevice implements Usecase<Device, StringParams> {
  /// Constructor
  RetrieveDevice(this.repository);

  /// Repository
  final DeviceRepository repository;

  @override
  Future<Either<Failure, Device>> call(StringParams params) =>
      repository.retrieve(params.value);
}
