import 'package:dribble_design1/widgets/socialMediaPhotosAndVideos.dart';
import 'package:flutter/material.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc4rdi7yIcgCYMI76dCj_182YiiGyPN-TXzQ&usqp=CAU'),
                  ),

                  /// Followers
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white24,
                      child: Column(
                        children: [
                          /// Followers Pictures
                          Row(
                            children: [
                              /// Followers pictures
                              Stack(
                                children: [
                                  Positioned(
                                      child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                  )),
                                  const Positioned(
                                      top: 20,
                                      left: 25,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.orange,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjv-LlSn3OR47vA5HF_uL2jN2ha-9ZymPMzA&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 45,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJyJxZzZmTbAz8VZLAymiFjWhPLxqNEjOIJQ&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 65,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.pink,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUncw5PB5syw9BIoymTrwyOjAqRlTZC1Rkew&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 85,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.yellow,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0sCAvrW1yFi0UYMgTZb113I0SwtW0dpby8Q&usqp=CAU'),
                                      )),
                                ],
                              )
                            ],
                          ),

                          /// Followers
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "32K",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text("Followers",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black45))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  /// Following pictures
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.white24,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              /// Following pictures
                              Stack(
                                children: [
                                  Positioned(
                                      child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                  )),
                                  const Positioned(
                                      top: 20,
                                      left: 25,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.orange,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjv-LlSn3OR47vA5HF_uL2jN2ha-9ZymPMzA&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 45,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJyJxZzZmTbAz8VZLAymiFjWhPLxqNEjOIJQ&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 65,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.pink,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUncw5PB5syw9BIoymTrwyOjAqRlTZC1Rkew&usqp=CAU'),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      left: 85,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.yellow,
                                        backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0sCAvrW1yFi0UYMgTZb113I0SwtW0dpby8Q&usqp=CAU'),
                                      )),
                                ],
                              )
                            ],
                          ),

                          /// Following
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "2K",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text("Following",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black45))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.06,
              //   width: MediaQuery.of(context).size.width * 0.65,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color: Colors.black12
              //   ),
              //   child: const Center(
              //       child: Text(
              //           " Photos & Videos",
              //         style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              //       ),),
              // ),
              const SocialMediaPhotosAndVideos()

            ],
          ),
        ),
      ),
    );
  }
}
