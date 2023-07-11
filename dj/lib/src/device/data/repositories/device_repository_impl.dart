import 'package:dartz/dartz.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';
import '../../../../shared/platform/push_notification.dart';
import '../../domain/entities/device.dart';
import '../../domain/repositories/device_repository.dart';
import '../database/device_remote_database.dart';

/// Implements [DeviceRepository]
class DeviceRepositoryImpl implements DeviceRepository {
  /// Constructor
  DeviceRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDatabase,
      required this.pushNotification});

  /// Network information
  final NetworkInfo networkInfo;

  /// Push notification service with device info
  final PushNotification pushNotification;

  /// Remote database
  final DeviceRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Device>> create(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final device = await pushNotification.deviceDetails();
      final remoteDevice =
          await remoteDatabase.create(documentID: documentID, device: device);
      return Right(remoteDevice);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<Device>>> list(List<String> documentIDs) async {
    try {
      await networkInfo.hasInternet();
      final remoteDevice = await remoteDatabase.list(documentIDs);
      return Right(remoteDevice);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, Device>> retrieve(String documentID) async {
    try {
      await networkInfo.hasInternet();
      final remoteDevice = await remoteDatabase.retrieve(documentID);
      return Right(remoteDevice);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
