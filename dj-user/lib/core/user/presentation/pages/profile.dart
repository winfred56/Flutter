import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Profile')),
        body: SafeArea(
            child: SingleChildScrollView(child: Column(children: []))));
  }
}
