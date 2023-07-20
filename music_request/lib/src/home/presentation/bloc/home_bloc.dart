import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/authenticated_user.dart';
import '../../../../core/user/domain/usecases/retrieve.dart';
import '../../../../shared/usecase/usecase.dart';

class HomeBloc {
  /// Constructor
  HomeBloc({required this.authenticatedUser, required this.retrieveUser});
  final AuthenticatedUser authenticatedUser;
  final RetrieveUser retrieveUser;


  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }

  /// Retrieve a user instance
  Future<User> retrieve(String documentID) async {
    final result = await retrieveUser(StringParams(documentID));
    return result.fold((failure) => User.initial(), (success) => success);
  }
}
