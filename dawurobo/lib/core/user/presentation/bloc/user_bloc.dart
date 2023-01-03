import '../../../../shared/usecase/usecase.dart';
import '../../../../src/device/domain/usecases/create.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/authenticated.dart';
import '../../domain/use_cases/sign_in.dart';
import '../../domain/use_cases/update.dart';

class UserBloc {
  /// Constructor
  const UserBloc({
    required this.updateUser,
    required this.createProfile,
    required this.createDevice,
    required this.authenticatedUser
  });

  final AuthenticatedUser authenticatedUser;
  final UpdateUser updateUser;
  final CreateDevice createDevice;
  final SignIn createProfile;


  /// Update User details
  Future<String?> updateUserDetails(User user) async {
    final result = await updateUser(UpdateUserParams(user));
    return result.fold((failure) => failure.message, (user) => null);
  }

  /// Create a new device for FCMToken
  Future<String?> _device(String documentID) async {
    final result = await createDevice(StringParams(documentID));
    return result.fold((failure) => failure.toString(), (r) => null);
  }

  Future<String?> newSignIn(User user) async {
    final result = await createProfile(SignInParams(user));
    return result.fold(
            (failure) => failure.toString(),
            (success) => _device(success.id)
    );
  }

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }
}
