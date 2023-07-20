import 'package:flutter/material.dart';
import 'package:music_reques_dj/shared/extensions/extentions.dart';

import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../shared/utils/date_formatter.dart';
import '../../domain/entities/user.dart';
import '../logic/user_logic.dart';
import '../widgets/profile_detail.dart';
import '../widgets/profile_picture.dart';
import 'update_profile.dart';

class ProfilePage extends StatelessWidget with UserLogic{
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(elevation: 0,
            title: Text('Profile',
                style: theme.textTheme.labelLarge!
                    .copyWith(fontSize: 24, letterSpacing: 1)),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () =>
                      NavigationHelper.push(context, const UpdateProfilePage()),
                  icon: const Icon(Icons.edit, size: 20, color: Colors.black),
                  splashRadius: 20)
            ],
            backgroundColor: const Color.fromRGBO(244, 244, 244, 1)),
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
                        title: snapshot.requireData.fullName, icon: Icons.person),
                    ProfileDetail(
                        title: snapshot.requireData.email, icon: Icons.email),
                    ProfileDetail(
                        title: DateFormatter.birthDate(
                            snapshot.requireData.dateOfBirth),
                        icon: Icons.cake),
                    ProfileDetail.withTap(
                        'Logout', Icons.logout, () => signOut(context)),
                    OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.delete_forever,
                            color: theme.colorScheme.error),
                        label: Text('Delete Account',
                            style: theme.textTheme.headlineSmall!
                                .copyWith(color: theme.colorScheme.error)))
                  ]).padX(15),
                );
              } else {
                return Container();
              }
            }),
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1));
  }
}