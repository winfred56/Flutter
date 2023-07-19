import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/authenticated_user.dart';
import '../../../../shared/usecase/usecase.dart';

class HomeBloc{
  /// Constructor
  HomeBloc({
    required this.authenticatedUser
  });

  /// Get current [User]
  final AuthenticatedUser authenticatedUser;

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }
}