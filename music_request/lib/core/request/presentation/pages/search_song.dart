import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_request/core/request/presentation/widgets/search_results.dart';

import '../../../../injection_container.dart';
import '../../../user/domain/entities/user.dart';
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
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(children: [
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                          textAlign: TextAlign.center,
                          'Type the name of the song you\'d like to request, and we\'ll work our magic to find the perfect match for you! 🪄🔍'),
                    )),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                    const Center(
                        child: Icon(CupertinoIcons.music_note_2,
                            color: Colors.black, size: 50)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                          textAlign: TextAlign.center,
                          'Go ahead and let us know which tunes you want to dance to, and we\'ll make sure you have an unforgettable time at the party! 🎶💃🕺'),
                    )),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Center(
                        child: TextFormField(
                            controller: songController,
                            decoration: const InputDecoration(
                                hintText: 'Search for a song'))),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
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
                                              return SearchResults(
                                                  results: value,
                                                  dj: widget.dj);
                                            });
                                      });
                                      songController.text = '';
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
                            })),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    const Center(
                        child: Text(
                            'Let the music play and the good times roll! 🎵🎉'))
                  ])),
            )));
  }
}
