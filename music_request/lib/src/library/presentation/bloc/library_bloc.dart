import '../../../../core/request/domain/entities/request.dart';
import '../../../../core/request/domain/usecases/list.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/authenticated_user.dart';
import '../../../../shared/usecase/usecase.dart';

class LibraryBloc {
  /// Constructor
  LibraryBloc({
    required this.listRequests,
    required this.authenticatedUser,
  });

  final ListRequests listRequests;
  final AuthenticatedUser authenticatedUser;

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }

  /// Retrieve all Requests
  Stream<List<Request>> listAllRequests(String djID) async* {
    final result = await listRequests(StringParams(djID));
    yield* result.fold((failure) async* {
      yield <Request>[];
    }, (requests) async* {
      yield* requests;
    });
  }
}
