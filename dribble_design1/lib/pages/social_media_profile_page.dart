import 'package:dribble_design1/widgets/socialMediaPhotosAndVideos.dart';
import 'package:flutter/material.dart';

import '../widgets/followers_and_following cards.dart';

class SocialMediaProfilePage extends StatefulWidget {
  const SocialMediaProfilePage({Key? key}) : super(key: key);

  @override
  State<SocialMediaProfilePage> createState() => _SocialMediaProfilePageState();
}

class _SocialMediaProfilePageState extends State<SocialMediaProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// menu button and back button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.undo_rounded)),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.more_horiz_rounded))
                ],
              ),

              /// Profile Image, Followers & Following
              const FollowingAndFollowers(),
              const Padding(padding: EdgeInsets.only(top: 20)),

              /// Profile Name, Follow & Message Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Profile name
                  Column(
                    children: const [
                      Text(
                        "Winfred",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "@aa_winfred😇",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  ),

                  /// Follow Button
                  Padding(
                    padding: const EdgeInsets.only(left: 140.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.orange),
                      onPressed: () {},
                      child: const Text("Follow"),
                    ),
                  ),

                  /// Message Button
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purple),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.message_outlined),
                    ),
                  )
                ],
              ),
              
              const Padding(padding: EdgeInsets.only(top: 40)),
              /// Gallery
              const SocialMediaPhotosAndVideos()

            ],
          ),
        ),
      ),
    );
  }
}
