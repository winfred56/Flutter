import 'package:flutter/material.dart';

class FollowingAndFollowers extends StatefulWidget {
  const FollowingAndFollowers({Key? key}) : super(key: key);

  @override
  State<FollowingAndFollowers> createState() => _FollowingAndFollowersState();
}

class _FollowingAndFollowersState extends State<FollowingAndFollowers> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            color: Colors.white70,
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
            color: Colors.white70,
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
    );
  }
}
