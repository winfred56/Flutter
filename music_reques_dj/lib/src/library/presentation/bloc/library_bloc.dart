import '../../../../core/requests/domain/entities/request.dart';
import '../../../../core/requests/domain/usecases/list.dart';
import '../../../../core/requests/domain/usecases/update.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/authenticated_user.dart';
import '../../../../shared/usecase/usecase.dart';

class LibraryBloc {
  /// Constructor
  LibraryBloc({
    required this.listRequests,
    required this.updateRequest,
    required this.authenticatedUser,
  });

  final ListRequests listRequests;
  final UpdateRequest updateRequest;
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

  /// Update a request
  Future<Request> update(Request request) async {
    final result = await updateRequest(UpdateRequestParams(request));
    return result.fold((failure) => Request.initial(), (success) => success);
  }
}
