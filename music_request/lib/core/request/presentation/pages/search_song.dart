import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

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
    final media = MediaQuery.of(context);
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
                                                          await bloc.request(request).then((value) {
                                                            Navigator.pop(context);
                                                            showDialog(context: context,
                                                                builder: (BuildContext context) => AlertDialog(
                                                                  actions: [
                                                                    TextButton(
                                                                        onPressed: () => Navigator.pop(context),
                                                                        child: const Text('Okay 👍'))
                                                                  ],
                                                                  content: SizedBox(
                                                                      height: media.size.height * 0.35,
                                                                      child: const Column(children: [
                                                                        Center(child: Icon(Icons.verified, color: Colors.green, size: 40)),
                                                                        Divider(),
                                                                        Text(
                                                                            'Your Song request has been submitted successfully.\n\n\nThe DJ will review and decide whether to play it or not.')
                                                                      ])),
                                                                )
                                                            );
                                                          });

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

