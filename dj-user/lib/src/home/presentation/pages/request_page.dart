import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/pulse.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key, required this.onPageSelected}) : super(key: key);
  final Function(int) onPageSelected;

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
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(4, 18, 32, 1),
              Color.fromRGBO(0, 14, 28, 1)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => widget.onPageSelected(0),
                                child: const Column(children: [
                                  Icon(Ionicons.musical_notes),
                                  Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text('Library'))
                                ])),
                            InkWell(
                                onTap: () => widget.onPageSelected(2),
                                child: const Column(children: [
                                  Icon(Ionicons.person),
                                  Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text('Profile'))
                                ]))
                          ])),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 80),
                      child: Text('Tap to request a song',
                          style: theme.textTheme.bodyMedium!
                              .apply(fontWeightDelta: 3))),
                  const Center(child: PulsingContainer()),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                  ActionChip(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      label: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Ionicons.search)),
                      elevation: 3)
                ])))));
  }
}
