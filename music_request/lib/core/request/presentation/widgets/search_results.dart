import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../../shared/platform/push_notification.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/request.dart';
import '../../domain/entities/song.dart';
import '../bloc/request_bloc.dart';

class SearchResults extends StatelessWidget {
  SearchResults({super.key, required this.results, required this.dj});
  final List<Song> results;
  final User dj;

  final bloc = sl<RequestBloc>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              if (results.isEmpty) {
                return const Center(child: Text('No results'));
              } else {
                return ListTile(
                    onTap: () async {
                      final request = Request.initial().copyWith(
                          song: results[index],
                          dj: dj,
                          date: DateTime.now().toString());
                      await bloc
                          .request(request)
                          .then((value) => sl<PushNotification>()
                              .sendLocalNotification(
                                  'You\'ve request ${results[index].songName} to be played for you.',
                                  'Request Sent! 🎵🎉'))
                          .then((value) => Navigator.pop(context));
                    },
                    leading: Image(
                        image: NetworkImage(results[index].songImage),
                        fit: BoxFit.cover),
                    title: Text(results[index].songName),
                    subtitle: Text(results[index].artistName));
              }
            }));
  }
}
