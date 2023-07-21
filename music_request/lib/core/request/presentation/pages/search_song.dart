import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:music_request/core/song/domain/entities/song.dart';

class SearchSongPage extends StatefulWidget {
  const SearchSongPage({Key? key}) : super(key: key);

  @override
  State<SearchSongPage> createState() => _SearchSongPageState();
}

class _SearchSongPageState extends State<SearchSongPage> {
  TextEditingController songController = TextEditingController();

  /// Loading Notifier
  final loading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Column(children: [
                  Center(
                      child: TextFormField(
                          controller: songController,
                          decoration: const InputDecoration(
                              hintText: 'Search for a song'))),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      child: ValueListenableBuilder<bool>(
                          valueListenable: loading,
                          builder: (context, value, child) {
                            return ElevatedButton(
                                onPressed: () async {
                                  if(songController.text.isNotEmpty){
                                    loading.value = true;
                                  await research(songController.text)
                                      .then((value) {
                                    loading.value = false;
                                        return showModalBottomSheet(
                                    showDragHandle: true,
                                    enableDrag: true,
                                    backgroundColor: Colors.grey,
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.5,
                                              child: ListView.builder(
                                                  itemCount: value.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    if (value.isEmpty) {
                                                      return const Center(
                                                          child: Text(
                                                              'No results'));
                                                    } else {
                                                      return ListTile(
                                                        onTap: (){},
                                                        title: Text(value[index]
                                                            .songName),
                                                        trailing: Text(
                                                            value[index]
                                                                .artistName),
                                                      );
                                                    }
                                                  }),
                                            );
                                          });
                                      });
                                }},
                                child: value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white)
                                    : Text('Search',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .apply(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface)));
                          }))
                ]))));
  }
}

Future<String> auth() async {
  String url = "https://accounts.spotify.com/api/token";
  String clientId = dotenv.get('client_id', fallback: '');
  String clientSecret = dotenv.get('client_secret', fallback: '');


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
      print("Access Token: $accessToken");
      return accessToken;
    } else {
      // Request failed
      print("Request failed with status: ${response.statusCode}");
      print("Request failed with status: ${response.body}");
      return 'accessToken';
    }
  } catch (e) {
    // Error occurred during the request
    print("Error: $e");
    return 'accessToken';
  }
}

Future<List<Song>> research(String song) async {
  String accessToken = await auth();
  String baseUrl = "https://api.spotify.com/v1/search";
  String searchQuery = song; // Replace with your custom search query
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
                ['name']));
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
