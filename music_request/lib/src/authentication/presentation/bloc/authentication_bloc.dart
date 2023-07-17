import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/authenticated_user.dart';
import '../../../../core/user/domain/usecases/create_user.dart';
import '../../../../core/user/domain/usecases/logout.dart';
import '../../../../core/user/domain/usecases/retrieve.dart';
import '../../../../core/user/domain/usecases/update.dart';
import '../../../../shared/platform/push_notification.dart';
import '../../../../shared/usecase/usecase.dart';

class AuthenticationBloc {
  /// Constructor
  AuthenticationBloc(
      {required this.createUser,
      required this.logoutUser,
      required this.updateUser,
      required this.authenticatedUser,
      required this.pushNotification,
      required this.retrieveUser});

  final CreateUser createUser;
  final RetrieveUser retrieveUser;
  final LogoutUser logoutUser;
  final UpdateUser updateUser;
  final AuthenticatedUser authenticatedUser;
  final PushNotification pushNotification;

  /// Creates a user profile on Firebase
  Future<String?> createUserProfile(User user) async {
    final fcmToken = await pushNotification.fcmToken();
    final result =
        await createUser(CreateUserParams(user.copyWith(fcmToken: fcmToken)));
    return result.fold((failure) => failure.toString(), (success) => null);
  }

  /// Retrieve a user instance
  Future<User> retrieve(String documentID) async {
    final result = await retrieveUser(StringParams(documentID));
    return result.fold((failure) => User.initial(), (success) => success);
  }

  /// Logs out a user and deletes saved instance from local storage
  Future<String?> logOUt() async {
    final result = await logoutUser(NoParams());
    return result.fold((failure) => failure.toString(), (user) => null);
  }

  /// Update User Profile
  Future<String?> updateUserProfile(User user) async {
    final result = await updateUser(UpdateUserParams(user));
    return result.fold((failure) => failure.message, (success) => null);
  }

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }
}
