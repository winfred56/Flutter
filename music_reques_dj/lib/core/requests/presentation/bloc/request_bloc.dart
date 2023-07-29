import 'package:music_reques_dj/core/requests/domain/usecases/list.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../../user/domain/entities/user.dart';
import '../../../user/domain/usecases/authenticated_user.dart';
import '../../domain/entities/request.dart';
import '../../domain/usecases/update.dart';

class RequestBloc {
  /// Constructor
  RequestBloc({
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
  Stream<List<Request>> listAllPendinRequests(String djID) async* {
    final result = await listRequests(StringParams(djID));
    yield* result.fold((failure) async* {
      yield <Request>[];
    }, (requests) async* {
      yield* requests.where((event) {
        event.retainWhere((element) => element.status == Status.pending);
        if (event.isEmpty) {
          return event.isEmpty;
        } else {
          return event.isNotEmpty;
        }
      });
    });
  }

  /// Update a request
  Future<Request> update(Request request) async {
    final result = await updateRequest(UpdateRequestParams(request));
    return result.fold((failure) => Request.initial(), (success) => success);
  }
}
