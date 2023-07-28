import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../injection_container.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/request.dart';
import '../bloc/request_bloc.dart';

class SearchSongPage extends StatefulWidget {
  const SearchSongPage({Key? key, required this.dj}) : super(key: key);
  final User dj;

  @override
  State<SearchSongPage> createState() => _SearchSongPageState();
}

class _SearchSongPageState extends State<SearchSongPage> {
  /// bloc
  final bloc = sl<RequestBloc>();

  /// Controller
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
                                  if (songController.text.isNotEmpty) {
                                    loading.value = true;
                                    await bloc
                                        .search(songController.text)
                                        .then((value) {
                                      loading.value = false;
                                      return showModalBottomSheet(
                                          showDragHandle: true,
                                          enableDrag: true,
                                          backgroundColor: Colors.grey,
                                          context: context,
                                          builder: (context) {
                                            return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5,
                                                child:ListView.builder(
                                                  itemCount: value.length,
                                                  itemBuilder: (context, index) {
                                                    if (value.isEmpty) {
                                                      return const Center(child: Text('No results'));
                                                    } else {
                                                      return ListTile(
                                                        onTap: () async {
                                                          final request = Request.initial().copyWith(
                                                            song: value[index],
                                                            dj: widget.dj,
                                                            date: DateTime.now().toString(),
                                                          );
                                                          await bloc.request(request);
                                                        },
                                                        leading: Image(
                                                          image: NetworkImage(value[index].songImage),
                                                          fit: BoxFit.cover
                                                        ),
                                                        title: Text(value[index].songName),
                                                        subtitle: Text(value[index].artistName),
                                                      );
                                                    }
                                                  }
                                                )
                                            );
                                          });
                                    });
                                  }
                                },
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

// Future<String> auth() async {
//   String url = "https://accounts.spotify.com/api/token";
//   String clientId = dotenv.get('CLIENT_ID', fallback: '');
//   String clientSecret = dotenv.get('CLIENT_SECRET', fallback: '');
//
//   Map<String, String> headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//   };
//
//   String body =
//       "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret";
//
//   try {
//     http.Response response =
//         await http.post(Uri.parse(url), headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = json.decode(response.body);
//       String accessToken = responseData['access_token'];
//       print("Access Token: $accessToken");
//       return accessToken;
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//       print("Request failed with status: ${response.body}");
//       return 'accessToken';
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//     return 'accessToken';
//   }
// }
//
// Future<List<Song>> research(String song) async {
//   String accessToken = await auth();
//   String baseUrl = "https://api.spotify.com/v1/search";
//   String searchQuery = song; // Replace with your custom search query
//   int limit = 5; // Number of results to limit
//   bool includeExternal = true; // Include external audio sources
//
//   String url =
//       "$baseUrl?q=$searchQuery&type=track&limit=$limit&include_external=$includeExternal";
//
//   Map<String, String> headers = {
//     'Authorization': 'Bearer $accessToken',
//   };
//
//   try {
//     http.Response response = await http.get(Uri.parse(url), headers: headers);
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response
//       Map<String, dynamic> responseData = await json.decode(response.body);
//       List<Song> songs = [];
//       for (int i = 0; i < responseData['tracks']['items'].length; i++) {
//         songs.add(Song(
//             songName: await responseData['tracks']['items'][i]['name'],
//             artistName: await responseData['tracks']['items'][i]['artists'][0]
//                 ['name'],
//             songImage: await responseData['tracks']['items'][i]['album']
//                 ['images'][0]['url']));
//       }
//       return songs;
//     } else {
//       // Request failed
//       print("Request failed with status: ${response.statusCode}");
//       return [];
//     }
//   } catch (e) {
//     // Error occurred during the request
//     print("Error: $e");
//     return [];
//   }
// }
