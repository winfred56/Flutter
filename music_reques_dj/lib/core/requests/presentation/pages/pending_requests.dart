import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:music_reques_dj/core/requests/domain/entities/request.dart';
import 'package:music_reques_dj/core/requests/presentation/bloc/request_bloc.dart';

import '../../../../injection_container.dart';
import '../../../user/domain/entities/user.dart';

class PendingRequestsPage extends StatefulWidget {
  const PendingRequestsPage({Key? key}) : super(key: key);

  @override
  State<PendingRequestsPage> createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends State<PendingRequestsPage> {
  final bloc = sl<RequestBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Requests'), centerTitle: true),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder<User>(
                future: bloc.getAuthenticatedUser(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.hasData) {
                    return StreamBuilder<List<Request>>(
                        stream:
                            bloc.listAllRequests(userSnapshot.requireData.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.requireData.isNotEmpty) {
                            return ListView.builder(
                                itemCount: snapshot.requireData.length,
                                itemBuilder: (context, index) {
                                  final request = snapshot.requireData[index];
                                  return Slidable(
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible:
                                              DismissiblePane(onDismissed: () {
                                            /// Accept Request
                                          }),
                                          children: [
                                            SlidableAction(
                                                onPressed: (context) {},
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                icon: Icons.verified,
                                                label: 'Accept')
                                          ]),
                                      startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible:
                                              DismissiblePane(onDismissed: () {
                                            /// Delete Item
                                          }),
                                          children: [
                                            SlidableAction(
                                                onPressed: (context) {},
                                                backgroundColor:
                                                    const Color(0xFFFE4A49),
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Delete')
                                          ]),
                                      child: ListTile(
                                          onTap: () => showModalBottomSheet(
                                              showDragHandle: true,
                                              elevation: 3,
                                              context: context,
                                              builder: (context) => SafeArea(
                                                  minimum: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: SizedBox(
                                                      child: Column(children: [
                                                    Row(children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                              Ionicons
                                                                  .close_circle)),
                                                      const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 15.0),
                                                          child: Text(
                                                              'Request From'))
                                                    ]),
                                                    const Divider(),
                                                    CircleAvatar(
                                                      radius: 40,
                                                      backgroundImage:
                                                          NetworkImage(request
                                                              .user.photo),
                                                    ),
                                                    Text(request.user.fullName)
                                                  ])))),
                                          leading: Image(
                                              image: NetworkImage(
                                                  request.song.songImage)),
                                          title: Text(request.song.songName),
                                          subtitle:
                                              Text(request.song.artistName),
                                          isThreeLine: true));
                                });
                          }
                          if (snapshot.hasData &&
                              snapshot.requireData.isEmpty) {
                            return const Center(
                                child: Text(
                                    'You do not have any son requests at the moment '));
                          }
                          return Container();
                        });
                  }
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    const Center(child: CircularProgressIndicator());
                  }
                  return Container();
                })));
  }
}
