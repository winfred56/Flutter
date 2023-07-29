import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:music_reques_dj/core/requests/domain/entities/request.dart';
import 'package:music_reques_dj/core/requests/presentation/bloc/request_bloc.dart';
import 'package:music_reques_dj/core/requests/presentation/widgets/small_profile.dart';

import '../../../../injection_container.dart';
import '../../../user/domain/entities/user.dart';

class PendingRequestsPage extends StatefulWidget {
  const PendingRequestsPage({Key? key, required this.user}) : super(key: key);
  final User user;

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
                            bloc.listAllPendinRequests(userSnapshot.requireData.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.requireData.isNotEmpty) {
                            return ListView.builder(
                                itemCount: snapshot.requireData.length,
                                itemBuilder: (context, index) {
                                  final request = snapshot.requireData[index];
                                  return Slidable(
                                      key: ValueKey(request.id),
                                      endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible: DismissiblePane(
                                              onDismissed: () async {
                                            /// Accept Request
                                            await bloc.update(request.copyWith(
                                                status: Status.accepted));
                                            (context as Element)
                                                .markNeedsBuild();
                                          }),
                                          children: [
                                            SlidableAction(
                                                onPressed: (context) {},
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                icon: CupertinoIcons.check_mark_circled,
                                                label: 'Accept')
                                          ]),
                                      startActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible: DismissiblePane(
                                              onDismissed: () async {
                                            /// Decline request
                                            await bloc.update(request.copyWith(
                                                status: Status.declined));
                                          }),
                                          children: [
                                            SlidableAction(
                                                onPressed: (context) {},
                                                backgroundColor:
                                                    const Color(0xFFFE4A49),
                                                foregroundColor: Colors.white,
                                                icon: CupertinoIcons.delete,
                                                label: 'Delete')
                                          ]),
                                      child: ListTile(
                                          onTap: () => showModalBottomSheet(
                                              showDragHandle: true,
                                              elevation: 3,
                                              context: context,
                                              builder: (context) =>
                                                  SmallProfile(
                                                      request: request)),
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
