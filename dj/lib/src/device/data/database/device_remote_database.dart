import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../shared/error/exception.dart';
import '../../domain/entities/device.dart';

/// Sends Device related info to server
abstract class DeviceRemoteDatabase {
  /// Calls fire store to register user
  Future<Device> create({required String documentID, required Device device});

  /// Calls fire store to get a device details
  Future<Device> retrieve(String documentID);

  /// Calls fire store to list all device details
  Future<List<Device>> list(List<String> documentIDs);
}

/// Implements [DeviceRemoteDatabase]
class DeviceRemoteDatabaseImpl implements DeviceRemoteDatabase {
  @override
  Future<Device> create(
      {required String documentID, required Device device}) async {
    final devices = FirebaseFirestore.instance.collection('devices');
    final user = {'profile': 'profiles/$documentID'};
    await devices.doc(documentID).set(device.toJson()..addAll(user));
    return device;
  }

  @override
  Future<List<Device>> list(List<String> documentIDs) async {
    final devices = await FirebaseFirestore.instance
        .collection('devices')
        .where(FieldPath.documentId, whereIn: documentIDs)
        .get();
    return devices.docs.map<Device>((e) => Device.fromJson(e.data())).toList();
  }

  @override
  Future<Device> retrieve(String documentID) async {
    final device = await FirebaseFirestore.instance
        .collection('devices')
        .doc(documentID)
        .get();
    if (!device.exists) {
      throw DeviceException(
          'Validation Error\nNo mobile device is associated with the recipient.');
    }
    return Device.fromJson(device.data()!);
  }
}
