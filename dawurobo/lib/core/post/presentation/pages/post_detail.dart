import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


import '../../../../injection_container.dart';
import '../../../../src/profile/presentation/pages/profile.dart';
import '../../../user/data/data_sources/local_database.dart';
import '../../../user/domain/entities/user.dart';
import '../../../user/presentation/pages/user_page.dart';
import '../../domain/entities/post.dart';
import '../bloc/PostBloc.dart';


class PostDetails extends StatefulWidget {
  const PostDetails({Key? key, required this.postId}) : super(key: key);
  final String postId;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  /// Bloc Holder
  final bloc = sl<PostBloc>();

  /// Notifier
  final postDetails = ValueNotifier(Post.initial());
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      postDetails.value = await bloc.getSpecificPost(widget.postId);
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
        valueListenable: postDetails,
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
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                      ),
                      title: TextButton(
                        onPressed: () {
                          if(value.author == firebase_auth.FirebaseAuth.instance.currentUser!.uid){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserPage()));
                          } else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                      userID: value.author,
                                    )));}
                        },
                        child: Text('@${value.author}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(fontSizeDelta: 1, fontWeightDelta: 1)),
                      ),
                      subtitle: Column(
                        children: [
                          Text(value.postText),
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
                                  onPressed: () {},
                                  icon:
                                  const Icon(Icons.favorite_border_outlined)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share_rounded))
                            ],
                          )
                        ],
                      ),
                      isThreeLine: true,
                    ),
                    const Divider(),
                    Text('Comments', style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
                  ],
                )
              )
            ),
          );
        });
  }
}
