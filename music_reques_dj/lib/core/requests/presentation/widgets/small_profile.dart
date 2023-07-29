import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/request.dart';

class SmallProfile extends StatelessWidget {
  const SmallProfile({super.key, required this.request});
  final Request request;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SafeArea(
        minimum: const EdgeInsets
            .symmetric(
            horizontal: 15),
        child: SizedBox(
            height: media.size.height * 0.35,
            child: Column(children: [
              
              const Divider(),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                NetworkImage(request
                    .user.photo)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(request.user.fullName),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(' Requested @ ${DateFormat('hh:mm a').format(DateTime.parse(request.date))}'),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                  height: media.size.height * 0.06,
                child: ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text('OK')),
              )
            ])));
  }
}
