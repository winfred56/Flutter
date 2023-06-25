import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Library')),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ListTile(
              minLeadingWidth: 0,
              onTap: () {},
              leading: const Icon(Icons.earbuds, color: Colors.white),
              title: const Text('Requests')),
          const Divider(),
          ListTile(
              minLeadingWidth: 0,
              onTap: () {},
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('DJ\'s')),
          const Divider(),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Recent Requests',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)))),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                width: media.size.width * 0.45,
                height: media.size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10),
                      child: SizedBox(
                          height: media.size.height * 0.15,
                          child: const Icon(Ionicons.musical_note, size: 120))),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('ksel')))
                ])),
            Container(
                width: media.size.width * 0.45,
                height: media.size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10),
                      child: SizedBox(
                          height: media.size.height * 0.15,
                          child: const Icon(Ionicons.musical_note, size: 120))),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('ksel')))
                ])),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                width: media.size.width * 0.45,
                height: media.size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10),
                      child: SizedBox(
                          height: media.size.height * 0.15,
                          child: const Icon(Ionicons.musical_note, size: 120))),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('ksel')))
                ])),
            Container(
                width: media.size.width * 0.45,
                height: media.size.height * 0.35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 10),
                      child: SizedBox(
                          height: media.size.height * 0.15,
                          child: const Icon(Ionicons.musical_note, size: 120))),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text('ksel')))
                ]))
          ])
        ]))));
  }
}
