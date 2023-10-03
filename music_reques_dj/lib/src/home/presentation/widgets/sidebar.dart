import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:music_reques_dj/shared/presentation/ui/navigation_helper.dart';
import 'package:music_reques_dj/src/home/presentation/widgets/about.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import 'side_bar_logic.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.user});
  final User user;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  /// Bloc
  final bloc = sl<HomeBloc>();
  /// Current User
  User user = User.initial();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
            (_) async => user = await bloc.getAuthenticatedUser());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    print('======= ${widget.user}');
    final media = MediaQuery.of(context);
    return SafeArea(
        child: Drawer(
            width: media.size.width * 0.8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Column(children: [
              Stack(children: [
                Container(
                    height: media.size.height * 0.3,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.green]))),
                // child: const SideBarGridPattern()),
                SizedBox(
                    height: media.size.height * 0.3,
                    width: double.infinity,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 15),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(widget.user.photo)))),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.user.fullName,
                                  style:
                                      const TextStyle(color: Colors.white)))),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.user.email,
                                  style: const TextStyle(color: Colors.white))))
                    ]))
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      title: const Text('View Your QR Code'),
                      onTap: () async {
                        print('====================== ${widget.user.id}');
                        await generateAndSavePDF(qrData: widget.user.id);
                      },
                      leading: const Icon(CupertinoIcons.eye_solid))),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      title: const Text('Contact Us'),
                      leading: const Icon(CupertinoIcons.phone_fill),
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: const Text('Get in Touch!'),
                              content: SizedBox(
                                  height: media.size.height*0.2,
                                child: Column(children: [
                                  const Divider(),
                                  const Icon(CupertinoIcons.phone_fill),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                    IconButton(
                                        onPressed: () => openWhatsApp(
                                            phoneNumber: '0201174285'),
                                        icon: const Icon(Ionicons.logo_whatsapp,
                                            color: Colors.black)),
                                    IconButton(
                                        onPressed: () =>
                                            openInstagram(username: 'aa_winfred'),
                                        icon: const Icon(Ionicons.logo_instagram,
                                            color: Colors.black)),
                                    IconButton(
                                        onPressed: () =>
                                            openGitHub(username: 'winfred56'),
                                        icon: const Icon(Ionicons.logo_github,
                                            color: Colors.black)),
                                    IconButton(
                                        onPressed: () =>
                                            openTwitter(username: 'aa_winfred'),
                                        icon: const Icon(Ionicons.logo_twitter,
                                            color: Colors.black)),
                                    // IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.phone_fill, color: Colors.black)),
                                  ])
                                ]),
                              ))))),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                      title: const Text('About Us'),
                      onTap: () => NavigationHelper.push(context, const AboutUs()),
                      leading: const Icon(CupertinoIcons.info))),
              const Spacer(),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Made with ❤️ by Winfred'))
            ])));
  }
}

