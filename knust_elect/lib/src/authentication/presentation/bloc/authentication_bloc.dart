import 'package:knust_elect/core/student/domain/use_cases/retrieve.dart';

import '../../../../core/student/domain/entities/student.dart';
import '../../../../core/student/domain/use_cases/signin.dart';
import '../../../../shared/usecase/usecase.dart';
import '../../../device/domain/usecases/create.dart';

class AuthenticationBloc {
  /// Constructor
  AuthenticationBloc(
      {required this.createDevice,
      required this.createProfile,
      required this.retrieveStudent});

  final CreateDevice createDevice;
  final SignIn createProfile;
  final RetrieveStudent retrieveStudent;

  /// Create a new device for FCMToken
  Future<String?> _device(String documentID) async {
    final result = await createDevice(StringParams(documentID));
    return result.fold((failure) => failure.toString(), (r) => null);
  }

  Future<String?> signIn(Student student) async {
    final result = await createProfile(SignInParams(student));
    return result.fold(
        (failure) => failure.toString(), (success) => _device(success.id));
  }
  Future<Student> retrieve(String documentID)async {
    final result = await retrieveStudent(StringParams(documentID));
    return result.fold((failure) => Student.initial(), (success) => success);
  }
}
