import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Library'),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Ionicons.settings))),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.earbuds, color: Colors.white),
              title: const Text('Requests')),
          const Divider(),
          ListTile(
              onTap: () {},
              leading: const Icon(Icons.nightlife, color: Colors.white),
              title: const Text('DJ\'s')),
          const Divider(),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Recent Requests')))
        ]))));
  }
}
