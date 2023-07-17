import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/authenticated_user.dart';
import '../../domain/usecases/delete.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/update.dart';

class UserBloc {
  UserBloc({
    required this.authenticatedUser,
    required this.updateUser,
    required this.deleteAccount,
    required this.logoutUser,
  });

  /// Get current [User] saved locally
  final AuthenticatedUser authenticatedUser;

  /// Log out current [User]
  final LogoutUser logoutUser;

  /// Updates the current [User]'s Profile
  final UpdateUser updateUser;

  /// Delete Account
  final DeleteAccount deleteAccount;

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
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

  Future<String?> deleteUserAccount(String documentID) async {
    final result = await deleteAccount(StringParams(documentID));
    return result.fold((failure) => null, (success) => null);
  }
}
