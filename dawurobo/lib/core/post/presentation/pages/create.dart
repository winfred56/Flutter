import 'package:dawurobo/core/post/domain/entities/post.dart';
import 'package:dawurobo/core/post/presentation/bloc/PostBloc.dart';
import 'package:dawurobo/core/user/presentation/bloc/user_bloc.dart';
import 'package:dawurobo/src/home/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../user/data/data_sources/local_database.dart';
import '../../../user/domain/entities/user.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  /// Form Controller
  final formKey = GlobalKey<FormState>();

  /// Post Bloc
  final bloc = sl<PostBloc>();

  /// Notifier
  final userDetails = ValueNotifier(User.initial());

  late TextEditingController postController = TextEditingController();

  createPost(Post post)async{
    await bloc.create(post);
  }

  /// Logout
  void logout() async {
    await firebase_auth.FirebaseAuth.instance.signOut();
    final result = sl<UserLocalDatabase>().retrieve() as User;
    await sl<UserLocalDatabase>().delete(result);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userDetails.value = await sl<UserBloc>().getAuthenticatedUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: userDetails, builder: (context, value, _){
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
            automaticallyImplyLeading: false,
            title: Text('Create Post ✏',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => logout(),
                  icon:
                  const Icon(Icons.exit_to_app_rounded, color: Colors.brown))
            ]),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: postController,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Enter Message Here",
                            fillColor: Colors.grey.shade400,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                final newPost = Post.initial().copyWith(
                                  postText: postController.value.text,
                                  author: value.id,
                                );
                                createPost(newPost);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                              }, child: const Text('Create Post')))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

