import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/device.dart';
import '../repositories/device_repository.dart';

/// Associate a device to a user
class CreateDevice implements Usecase<Device, StringParams> {
  /// Constructor
  CreateDevice(this.repository);

  /// Repository
  final DeviceRepository repository;

  @override
  Future<Either<Failure, Device>> call(StringParams params) =>
      repository.create(params.value);
}
