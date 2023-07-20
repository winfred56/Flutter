import 'package:flutter/material.dart';

import '../../../user/domain/entities/user.dart';
import '../widgets/pulse.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key, required this.dj}) : super(key: key);
  final User dj;

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            width: media.size.width,
            height: media.size.height,
            decoration: const BoxDecoration(color: Colors.blue),
            child: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 80),
                      child: Text('Tap to request a song',
                          style: theme.textTheme.bodyMedium!
                              .apply(fontWeightDelta: 3, color: Colors.white))),
                  Center(
                      child: PulsingContainer(dj: widget.dj)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                  const Text('DJ'),
                  Text(widget.dj.username)
                ])))));
  }
}
