import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_request/src/library/presentation/bloc/library_bloc.dart';

import '../../../../core/request/domain/entities/request.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({Key? key, required this.user}) : super(key: key);
  final User user;

  final bloc = sl<LibraryBloc>();
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(244, 244, 244, 0),
            elevation: 0,
            centerTitle: true,
            title: const Text('My Requests',
                style: TextStyle(color: Colors.black))),
        body: SafeArea(
            child: Column(children: [
          const Divider(),
          StreamBuilder<List<Request>>(
              stream: bloc.listAllRequests(user.id),
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
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Column(children: [
                                        Expanded(
                                            child: CachedNetworkImage(
                                                key: UniqueKey(),
                                                imageUrl:
                                                    request.song.songImage)),
                                        const SizedBox(height: 10),
                                        Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(request.song.songName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .apply(
                                                        color: Colors.black)))
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
                        Icon(CupertinoIcons.tray_fill,
                            color: Colors.blue, size: 80),
                        Text('No Requests at the moment.\nEmpty Playlist',
                            textAlign: TextAlign.center),
                      ]));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container();
              })
        ])));
  }
}
