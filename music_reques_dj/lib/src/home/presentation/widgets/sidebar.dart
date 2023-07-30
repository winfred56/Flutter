import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/user/domain/entities/user.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.user});
  final User user;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return SafeArea(
        child: Drawer(
            width: media.size.width * 0.8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.white,
            child: Column(
              children: [
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
                                    style: const TextStyle(color: Colors.white)))),
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.user.email,
                                    style: const TextStyle(color: Colors.white))))
                      ]))
                ]),

                const Padding(padding: EdgeInsets.only(top: 10), child: ListTile(
                  title: Text('Download QR Code'),
                  leading: Icon(CupertinoIcons.cloud_download_fill)
                )),
                const Padding(padding: EdgeInsets.only(top: 10), child: ListTile(
                    title: Text('Contact Us'),
                    leading: Icon(CupertinoIcons.phone_fill)
                )),
                const Padding(padding: EdgeInsets.only(top: 10), child: ListTile(
                    title: Text('About Us'),
                    leading: Icon(CupertinoIcons.info)
                )),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Made with love by Winfred')
                )
              ]
            )));
  }
}
