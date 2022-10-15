import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/notifications_list_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#688b97'),
      appBar: AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: HexColor('#688b97'),
      title: Align(
        alignment: Alignment.topRight,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          backgroundImage: const NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAY6rHUk-UzP-qHRIW3EBWLYLN4wG53DvpKA&usqp=CAU"),
          child: Stack(
            children: const [
              Positioned(
                top: 5,
                right: 0.1,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
      body: SafeArea(
        //minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Notifications
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 20),
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        ),
                      ),

                      /// View All Button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/campaign'),
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Notification number
                  Positioned(
                    left: 195,
                    top: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.06,
                      height: MediaQuery.of(context).size.height * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent,
                      ),
                      child: const Center(
                        child: Text('3'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      tileColor: HexColor('#9ea79e'),
                      title: const Text("Micheal",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: const Text("a minute ago"),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXNHHLyEZ9gRZICPoedWgX2NXgRI6zUPf7yA&usqp=CAU"),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                    const NotificationListItem(
                      title: 'Freda',
                      time: '3 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGZT-bhHh9nNDhSwElZ6IL6GZ1TJjeFHW_bA&usqp=CAU',
                      read: false,
                    ),
                    const NotificationListItem(
                      title: 'Mike',
                      time: '4 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2ppBY4_eZFdqWCjhhA3zwdNJsWE_6kwa2Bw&usqp=CAU',
                      read: false,
                    ),
                    const NotificationListItem(
                      title: 'Winfred 💯🙇🕊',
                      time: '7 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz8LgJk9e533KZdnWKFCV3hYdX8Zc7brV5wA&usqp=CAU',
                      read: false,
                    ),
                    const NotificationListItem(
                      title: 'Kendrick',
                      time: '17 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4w94yjX_JkENhCFm-E2PB8sYJy_ZNxiUBmg&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Richmond😎😎',
                      time: '20 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeyRqc0DVHR52-5pTLFz88fjkTelZwuZD6VQ&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Rihanna 👩',
                      time: '26 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV5bFSOHganMK4QCBmxRUwqwN2_sCZLJbrpPpAt3255UOuepzvxAVn5Er8L13OBeOqino&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Josh 😎',
                      time: '38 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv6tZgcsS2nrY3ylT4kmU5lGFz-umOs34Xph6Hz29Qm0NbBwk8mgtr2U4NIKZPw_6d9Hs&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Beyonce 🥰',
                      time: '49 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVNzIiLnErPad3qJZdipkTd18hdhfPgpzXg&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Ella 💃',
                      time: '50 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpimuXpLYb6kkpw7QG-Ct7f6pj-J1dWRvteg&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Henry',
                      time: '56 minutes ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1nYUKHA8kkUlIr9DG9woo_y0QtY9m9SGylQ&usqp=CAU',
                      read: true,
                    ),
                    const NotificationListItem(
                      title: 'Sam',
                      time: '2 hours ago',
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy8OejYCLmsxArvzRyeGWkh1l_6BYa0cy4YQ&usqp=CAU',
                      read: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
