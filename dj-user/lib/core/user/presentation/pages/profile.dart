import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return const Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(child: Column(children: [
              Center(child: Text('Profile'))
            ]))));
  }
}
