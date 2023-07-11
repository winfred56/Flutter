import 'package:dartz/dartz.dart';
import '../../../../shared/error/failure.dart';
import '../entities/device.dart';

/// Interacts with the device
abstract class DeviceRepository {
  /// Creates a device for the user
  Future<Either<Failure, Device>> create(String documentID);

  /// Get device details for a single user
  Future<Either<Failure, Device>> retrieve(String documentID);

  /// Get device details for bulk users
  Future<Either<Failure, List<Device>>> list(List<String> documentIDs);
}
