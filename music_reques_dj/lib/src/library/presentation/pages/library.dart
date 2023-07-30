import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_reques_dj/core/requests/presentation/widgets/accepted_requests.dart';
import 'package:music_reques_dj/core/requests/presentation/widgets/declined_requests.dart';

import '../../../../core/requests/domain/entities/request.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../bloc/library_bloc.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final bloc = sl<LibraryBloc>();
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Library')),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ListTile(
                  minLeadingWidth: 0,
                  onTap: () => showModalBottomSheet(
                      showDragHandle: true,
                      elevation: 3,
                      context: context,
                      builder: (context) =>
                          AcceptedRequests(user: widget.user)),
                  leading: const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.black),
                  title: const Text('Accepted Requests')),
              const Divider(),
              ListTile(
                  minLeadingWidth: 0,
                  onTap: () => showModalBottomSheet(
                      showDragHandle: true,
                      elevation: 3,
                      context: context,
                      builder: (context) =>
                          DeclinedRequests(user: widget.user)),
                  leading: const Icon(CupertinoIcons.delete_solid, color: Colors.black),
                  title: const Text('Declined Requests')),
              const Divider(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('All Requests',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)))),
              StreamBuilder<List<Request>>(
                  stream: bloc.listAllRequests(widget.user.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.requireData.isNotEmpty) {
                      return Expanded(
                          child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              children: [
                            GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.requireData.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        childAspectRatio: 1,
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int index) {
                                  final request = snapshot.requireData[index];
                                  return Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Column(children: [
                                            Expanded(
                                                child: CachedNetworkImage(
                                                    key: UniqueKey(),
                                                    imageUrl: request
                                                        .song.songImage)),
                                            const SizedBox(height: 10),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                    request.song.songName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .apply(
                                                            color:
                                                                Colors.black)))
                                          ])));
                                })
                          ]));
                    }
                    if (snapshot.hasData && snapshot.requireData.isEmpty) {
                      return const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.tray_fill, color: Colors.blue, size: 80),
                              Text('No Requests at the moment.\nEmpty Playlist', textAlign: TextAlign.center),
                            ]
                          ));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  }),
            ])));
  }
}
