import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawurobo/core/post/presentation/pages/create.dart';
import 'package:dawurobo/core/post/presentation/pages/post_detail.dart';
import 'package:dawurobo/src/device/domain/entities/device.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/post/domain/entities/post.dart';
import '../../../../core/post/presentation/bloc/PostBloc.dart';
import '../../../../core/user/data/data_sources/local_database.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/presentation/pages/user_page.dart';
import '../../../../injection_container.dart';
import '../../../../shared/notifications/push_notification.dart';
import '../../../profile/presentation/pages/profile.dart';
import '../../../share/data/data_sources/share_remote_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = sl<PostBloc>();

  /// Notifier
  ValueNotifier<List<Post>> availablePosts = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    //ShareRemoteDatabaseImpl.initializeDynamicLink();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      availablePosts.value = await bloc.retrieve();
    });
    setState(() {});
  }

  sendNotification(String title, String token)async{

    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try{
      http.Response response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),headers: <String,String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=AAAA7NEUBtQ:APA91bFXJb8RWaNPOwdeu3Ih3Jlb3hvQWjp1eRSxMs2xpMuOcJMdzYQYqZHP82-hYCDErFrrQdfrZ9cGiTlkNKvrgJqmaRrNoVqjPKNx34E76tyqwg2GLrt8cR9qSJveJEn0zxyW6qgY'
      },
          body: jsonEncode(<String,dynamic>{
            'notification': <String,dynamic> {'title': title,'body': 'You are followed by someone'},
            'priority': 'high',
            'data': data,
            'to': token
          })
      );


      if(response.statusCode == 200){
        print("Yeh notification is sent");
      }

    }catch(e){
      print(e);
    }

  }

  void logout() async {
    await firebase_auth.FirebaseAuth.instance.signOut();
    final result = sl<UserLocalDatabase>().retrieve() as User;
    await sl<UserLocalDatabase>().delete(result);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: availablePosts,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserPage())),
                  icon: const Icon(
                    Icons.person_rounded,
                    color: Colors.brown,
                  )),
              automaticallyImplyLeading: false,
              title: Text('Dawurobo',
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
              ],
            ),
            body: ListView.builder(
                itemCount: value.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostDetails(postId: value[index].id)));
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                      ),
                      title: TextButton(
                        onPressed: () {
                          if (value[index].author ==
                              firebase_auth
                                  .FirebaseAuth.instance.currentUser!.uid) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserPage()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          userID: value[index].author,
                                        )));
                          }
                        },
                        child: Text('@${value[index].author}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(fontSizeDelta: 1, fontWeightDelta: 1)),
                      ),
                      subtitle: Column(
                        children: [
                          Text(value[index].postText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.poll_outlined)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.mode_comment_rounded)),
                              IconButton(
                                  onPressed: () async {
                                    print(value[index].author);
                                    final device = await FirebaseFirestore.instance.collection('devices').doc(value[index].author).get();
                                    final result = device.data()!;
                                    final token = Device.fromJson(result);
                                    print(token.fcmToken);
                                    await sendNotification('Unfollow', token.fcmToken);
                                  },
                                  icon: const Icon(
                                      Icons.favorite_border_outlined)),
                              IconButton(
                                  onPressed: () async {
                                    print(
                                        '=======================================');
                                    final generatedLink =
                                        await ShareRemoteDatabaseImpl()
                                            .createDynamicLink(value[index].id);
                                    await Share.share(generatedLink, subject: 'Check this out');
                                    print(generatedLink);

                                  },
                                  icon: const Icon(Icons.share_rounded))
                            ],
                          )
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePostPage())),
                child: const Icon(Icons.add)),
          );
        });
  }
}

// ListTile(
//   leading: const CircleAvatar(
//     radius: 30,
//     backgroundColor: Colors.orange,
//   ),
//   title: Text('@username',
//       style: Theme.of(context)
//           .textTheme
//           .bodyMedium!
//           .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
//   subtitle: Column(
//     children: [
//       const Text(
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.poll_outlined)),
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.mode_comment_rounded)),
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.favorite_border_outlined)),
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.share_rounded))
//         ],
//       )
//     ],
//   ),
//   isThreeLine: true,
// ),
