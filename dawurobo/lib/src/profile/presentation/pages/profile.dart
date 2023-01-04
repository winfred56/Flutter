import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


import '../../../../core/user/data/data_sources/local_database.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../bloc/ProfileBloc.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key, required this.userID}) : super(key: key);
  final String userID;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  /// Notifier
  final userDetails = ValueNotifier(User.initial());

  /// Bloc Holder
  final bloc = sl<ProfileBloc>();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userDetails.value = await bloc.retrieveProfile(widget.userID);
    });
    setState(() {});
  }

  /// Logout
  void logout() async {
    await firebase_auth.FirebaseAuth.instance.signOut();
    final result = sl<UserLocalDatabase>().retrieve() as User;
    await sl<UserLocalDatabase>().delete(result);
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: userDetails,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    )),
                automaticallyImplyLeading: false,
                title: Text('Edit Profile ✏',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () => logout(),
                      icon: const Icon(Icons.exit_to_app_rounded,
                          color: Colors.brown))
                ]),
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
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(10),
                                  onPressed: () {}),
                            )),
                        Text(value.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                        Text(value.email),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: Colors.grey,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Following',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .apply(
                                              fontSizeDelta: 3,
                                              fontWeightDelta: 4)),
                                    ),
                                    Text("${value.followers}"),
                                  ])),
                              const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                              Card(
                                  color: Colors.grey,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Followers',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .apply(
                                              fontSizeDelta: 3,
                                              fontWeightDelta: 4)),
                                    ),
                                    Text("${value.following}"),
                                  ]))
                            ]),
                        const Divider(),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 30)),
                        const Center(
                            child: Text(
                              '😇',
                              style: TextStyle(fontSize: 65),
                            )),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(onPressed: (){
                            //TODO: Send a push notification to user {@username started following you}
                          }, child: const Text('Follow')),
                        )
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
