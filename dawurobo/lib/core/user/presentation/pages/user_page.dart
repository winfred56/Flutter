import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../data/data_sources/local_database.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';

import 'edit_profile.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  /// Bloc Holder
  final bloc = sl<UserBloc>();

  /// Notifier
  final userDetails = ValueNotifier(User.initial());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userDetails.value = await bloc.getAuthenticatedUser();
    });
    setState(() {});
  }

  /// Logout
  void logout()async{
    await firebase_auth.FirebaseAuth.instance.signOut();
    final result =  sl<UserLocalDatabase>().retrieve() as User;
    await sl<UserLocalDatabase>().delete(result);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: userDetails, builder: (context, value, _){
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,)),
            automaticallyImplyLeading: false,
            title: Text('Edit Profile ✏',
                style: Theme.of(context).textTheme.bodyMedium!
                    .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () => logout(), icon: const Icon(Icons.exit_to_app_rounded, color: Colors.brown))
            ]
        ),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue,
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: ActionChip(
                              label: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                              ),
                              //backgroundColor: theme.colorScheme.primary,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(10),
                              onPressed: () {print(value.fullName);},
                            ))),
                    Text(value.fullName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                    Text(value.email),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                            style: ButtonStyle(
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: const BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid)))),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditProfile())),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.brown),
                            ))),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Card(
                          color: Colors.grey,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Following',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                            ),
                            Text("${value.followers}"),
                          ])),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Card(
                          color: Colors.grey,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Followers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                            ),
                            Text("${value.following}"),
                          ]))
                    ]),
                    const Divider(),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                    const Center(
                        child: Text(
                          '😇',
                          style: TextStyle(fontSize: 65),
                        )),
                  ],
                ),
              ),
            )),
      );
    });
  }
}




