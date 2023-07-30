import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/request.dart';
import '../../domain/entities/song.dart';

abstract class RequestRemoteDatabase {
  /// Send/Create a request
  Future<Request> sendRequest(Request request);

  /// Search for a song
  Future<List<Song>> searchForSong(String songTitle);

  /// All requests made by this user
  Stream<List<Request>> list(String djID);
}

class RequestRemoteDatabaseImpl implements RequestRemoteDatabase {
  Future<String> getAccessToken() async {
    String url = "https://accounts.spotify.com/api/token";
    String clientId = dotenv.get('CLIENT_ID', fallback: '');
    String clientSecret = dotenv.get('CLIENT_SECRET', fallback: '');

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    String body =
        "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret";

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // Request successful, handle the response
        Map<String, dynamic> responseData = json.decode(response.body);
        String accessToken = responseData['access_token'];
        return accessToken;
      } else {
        return 'accessToken';
      }
    } catch (e) {
      // Error occurred during the request
      print("Error: $e");
      return 'accessToken';
    }
  }

  @override
  Future<List<Song>> searchForSong(String songTitle) async {
    String accessToken = await getAccessToken();
    String baseUrl = "https://api.spotify.com/v1/search";
    String searchQuery = songTitle;
    int limit = 5; // Number of results to limit
    bool includeExternal = true; // Include external audio sources

    String url =
        "$baseUrl?q=$searchQuery&type=track&limit=$limit&include_external=$includeExternal";

    Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // Request successful, handle the response
        Map<String, dynamic> responseData = await json.decode(response.body);
        List<Song> songs = [];
        for (int i = 0; i < responseData['tracks']['items'].length; i++) {
          songs.add(Song(
              songName: await responseData['tracks']['items'][i]['name'],
              artistName: await responseData['tracks']['items'][i]['artists'][0]
                  ['name'],
              songImage: await responseData['tracks']['items'][i]['album']
                  ['images'][0]['url']));
        }
        return songs;
      } else {
        // Request failed
        print("Request failed with status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      // Error occurred during the request
      print("Error: $e");
      return [];
    }
  }

  @override
  Future<Request> sendRequest(Request request) async {
    final documentID = FirebaseFirestore.instance.collection('requests').doc();
    final extras = {'id': documentID.id};
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(documentID.id)
        .set(request.toJson()..addAll(extras));
    return request.copyWith(id: documentID.id);
  }

  @override
  Stream<List<Request>> list(String djID) async* {
    yield* FirebaseFirestore.instance
        .collection('requests')
        .orderBy('date', descending: true)
        .snapshots()
        .map((request) => request.docs
            .where((requestDoc) => (requestDoc.data()['user']['id']) == (djID))
            .map<Request>((event) => Request.fromJson(event.data()))
            .toList());
  }
}
