import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/user/domain/entities/user.dart';

abstract class ProfileRemoteDatabase{
  Future<User> retrieveUserProfile(String documentID);
}

class ProfileRemoteDatabaseImpl implements ProfileRemoteDatabase{
  @override
  Future<User> retrieveUserProfile(String documentID) async {
    try {
      final userMap = await FirebaseFirestore.instance
          .collection('profiles')
          .doc(documentID).get();
      final result = User.fromJson(userMap.data()!);
      return result;
    } on Exception catch (error) {
      print(error.toString());
      return User.initial();
    }
  }

}