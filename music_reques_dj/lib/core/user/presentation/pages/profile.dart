import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_reques_dj/shared/extensions/extentions.dart';

import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../shared/utils/date_formatter.dart';
import '../../domain/entities/user.dart';
import '../logic/user_logic.dart';
import '../widgets/profile_detail.dart';
import '../widgets/profile_picture.dart';
import 'update_profile.dart';

class ProfilePage extends StatelessWidget with UserLogic {
  ProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text('Profile',
                style: theme.textTheme.labelLarge!
                    .copyWith(fontSize: 24, color: Colors.white)),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () =>
                      NavigationHelper.push(context, const UpdateProfilePage()),
                  icon: const Icon(CupertinoIcons.pencil, size: 20, color: Colors.white),
                  splashRadius: 20)
            ],
            // backgroundColor: const Color.fromRGBO(244, 244, 244, 1)
        ),
        body: FutureBuilder<User>(
            future: bloc.getAuthenticatedUser(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView(children: [
                    ProfilePicture(),
                    ProfileDetail(
                        title: snapshot.requireData.fullName,
                        icon: CupertinoIcons.person_alt),
                    ProfileDetail(
                        title: snapshot.requireData.email, icon: CupertinoIcons.mail_solid),
                    ProfileDetail(
                        title: DateFormatter.birthDate(
                            snapshot.requireData.dateOfBirth),
                        icon: CupertinoIcons.calendar),
                    ProfileDetail.withTap(
                        'Logout', Icons.logout, () => signOut(context))
                  ]).padX(15),
                );
              } else {
                return Container();
              }
            }),
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1));
  }
}
