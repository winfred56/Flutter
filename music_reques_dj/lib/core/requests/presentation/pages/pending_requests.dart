import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';
import 'package:music_reques_dj/core/requests/domain/entities/request.dart';
import 'package:music_reques_dj/core/requests/presentation/bloc/request_bloc.dart';
import 'package:music_reques_dj/core/requests/presentation/widgets/small_profile.dart';

import '../../../../injection_container.dart';
import '../../../../src/home/presentation/widgets/sidebar.dart';
import '../../../user/domain/entities/user.dart';

class PendingRequestsPage extends StatefulWidget {
  const PendingRequestsPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<PendingRequestsPage> createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends State<PendingRequestsPage> {
  final bloc = sl<RequestBloc>();

  /// Scaffold Key
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
        key: scaffoldKey,
        drawer: SideBar(user: widget.user),
        body: FutureBuilder<User>(
            future: bloc.getAuthenticatedUser(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                return Column(
                  children: [
                    Stack(children: [
                      Container(
                          height: media.size.height * 0.15,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue, Colors.green]))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: IconButton(
                                onPressed: () =>
                                    scaffoldKey.currentState?.openDrawer(),
                                icon: const Icon(Ionicons.menu,
                                    color: Colors.black)),
                          )),
                      const Positioned.fill(child: Center(child: Text('Music Requests', style: TextStyle(fontSize: 28, color: Colors.white))))
                    ]),
                    Expanded(
                      child: StreamBuilder<List<Request>>(
                          stream: bloc.listAllPendinRequests(
                              userSnapshot.requireData.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.requireData.isNotEmpty) {
                              return SafeArea(
                                minimum:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: ListView.builder(
                                    itemCount: snapshot.requireData.length,
                                    itemBuilder: (context, index) {
                                      final request =
                                          snapshot.requireData[index];
                                      return Slidable(
                                          key: ValueKey(request.id),
                                          endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              dismissible: DismissiblePane(
                                                  onDismissed: () async {
                                                /// Accept Request
                                                await bloc.update(
                                                    request.copyWith(
                                                        status:
                                                            Status.accepted));
                                                (context as Element)
                                                    .markNeedsBuild();
                                              }),
                                              children: [
                                                SlidableAction(
                                                    onPressed: (context) {},
                                                    backgroundColor:
                                                        Colors.green,
                                                    foregroundColor:
                                                        Colors.white,
                                                    icon: CupertinoIcons
                                                        .check_mark_circled,
                                                    label: 'Accept')
                                              ]),
                                          startActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              dismissible: DismissiblePane(
                                                  onDismissed: () async {
                                                /// Decline request
                                                await bloc.update(
                                                    request.copyWith(
                                                        status:
                                                            Status.declined));
                                              }),
                                              children: [
                                                SlidableAction(
                                                    onPressed: (context) {},
                                                    backgroundColor:
                                                        const Color(0xFFFE4A49),
                                                    foregroundColor:
                                                        Colors.white,
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
                                              title:
                                                  Text(request.song.songName),
                                              subtitle:
                                                  Text(request.song.artistName),
                                              isThreeLine: true));
                                    }),
                              );
                            }
                            if (snapshot.hasData &&
                                snapshot.requireData.isEmpty) {
                              return const Center(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Icon(CupertinoIcons.tray_fill,
                                        color: Colors.blue, size: 80),
                                    Text(
                                        'You do not have any requests at the moment.\nEmpty Playlist',
                                        textAlign: TextAlign.center)
                                  ]));
                            }
                            return Container();
                          }),
                    ),
                  ],
                );
              }
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                const Center(child: CircularProgressIndicator());
              }
              return Container();
            }));
  }
}
