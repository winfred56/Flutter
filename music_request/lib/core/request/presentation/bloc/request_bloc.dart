import 'package:music_request/core/request/domain/entities/song.dart';
import 'package:music_request/core/request/domain/usecases/search.dart';
import 'package:music_request/core/request/domain/usecases/send_request.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../../user/domain/entities/user.dart';
import '../../../user/domain/usecases/authenticated_user.dart';
import '../../domain/entities/request.dart';

class RequestBloc {
  /// Constructor
  RequestBloc(
      {required this.sendSongRequest,
      required this.searchSong,
      required this.authenticatedUser});

  final SearchSong searchSong;
  final SendSongRequest sendSongRequest;
  final AuthenticatedUser authenticatedUser;

  /// Get an authenticated user account
  Future<User> getAuthenticatedUser() async {
    final result = await authenticatedUser(NoParams());
    return result.fold((failure) => User.initial(), (user) => user);
  }

  /// Send a request
  Future<String?> request(Request request) async {
    final user = await getAuthenticatedUser();
    final result = await sendSongRequest(
        SendSongRequestParams(request.copyWith(user: user)));
    return result.fold((failure) => failure.message, (success) => null);
  }

  /// Search for a song
  Future<List<Song>> search(String songTitle) async {
    final result = await searchSong(StringParams(songTitle));
    return result.fold((failure) => [], (success) => success);
  }
}
