import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../../src/library/presentation/bloc/library_bloc.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/request.dart';

class DeclinedRequests extends StatelessWidget {
  DeclinedRequests({super.key, required this.user});
  final User user;

  final bloc = sl<LibraryBloc>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SizedBox(
        height: media.size.height * 0.5,
        child: StreamBuilder<List<Request>>(
            stream: bloc.listAllDeclineRequests(user.id),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasData && snapshot.requireData.isNotEmpty){
                return ListView.builder(
                    itemCount: snapshot.requireData.length,
                    itemBuilder: (context, index){
                      final request = snapshot.requireData[index];
                      return ListTile(
                          onTap: ()=>showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                              title: const Text('Request Details', style: TextStyle(fontWeight: FontWeight.w600)),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Okay 👍'))
                              ],
                              content: SizedBox(
                                  height: media.size.height * 0.24,
                                  child: Column(
                                      children: [
                                        const Divider(),
                                        const Align(alignment:Alignment.centerLeft, child: Text('Request from: ')),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(radius: 40,
                                                backgroundImage: NetworkImage(request.user.photo))
                                        ),
                                        Text(request.user.fullName)
                                      ]
                                  )
                              )
                          )),
                          leading: Image(
                              image: NetworkImage(
                                  request.song.songImage)),
                          title: Text(request.song.songName),
                          subtitle:
                          Text(request.song.artistName),
                          isThreeLine: true
                      );
                    });
              }
              if(snapshot.hasData && snapshot.requireData.isEmpty){
                return const Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.tray_fill, color: Colors.blue, size: 80),
                          Text(
                              'You do not have any requests at the moment.\nEmpty Playlist', textAlign: TextAlign.center)
                        ]
                    ));
              }
              return Container();
            }
        )
    );
  }
}
