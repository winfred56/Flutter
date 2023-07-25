import '../../domain/entities/request.dart';
import '../../domain/entities/song.dart';

abstract class RequestRemoteDatabase{

  /// Send/Create a request
  Future<Request> sendRequest(Request request);

  /// Search for a song
  Future<Song> searchForSong(String songTitle);
}