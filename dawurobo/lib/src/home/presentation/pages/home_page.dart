import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../core/user/presentation/pages/user_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void logout()async{
    await firebase_auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserPage())),
              icon: const Icon(Icons.person_rounded, color: Colors.brown,)),
          automaticallyImplyLeading: false,
          title: Text('Dawurobo',
              style: Theme.of(context).textTheme.bodyMedium!
                  .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
          centerTitle: true,
        actions: [
          IconButton(onPressed: () => logout(), icon: const Icon(Icons.exit_to_app_rounded, color: Colors.brown))
        ],
      ),
      body: SafeArea(
        //minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text('@username', style: Theme.of(context).textTheme.bodyMedium!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
                  subtitle: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.poll_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded))
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.yellow,
                  ),
                  title: Text('@username', style: Theme.of(context).textTheme.bodyMedium!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
                  subtitle: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.poll_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded))
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                  title: Text('@username', style: Theme.of(context).textTheme.bodyMedium!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
                  subtitle: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.poll_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded))
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink,
                  ),
                  title: Text('@username', style: Theme.of(context).textTheme.bodyMedium!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
                  subtitle: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.poll_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded))
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange,
                  ),
                  title: Text('@username', style: Theme.of(context).textTheme.bodyMedium!
                      .apply(fontSizeDelta: 2, fontWeightDelta: 1)),
                  subtitle: Column(
                    children: [
                      const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et fermentum libero, vulputate commodo ligula. Aliquam eu facilisis lorem. Phasellus massa urna, vulputate placerat ligula porttitor, semper mattis risus.'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.poll_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mode_comment_rounded)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.share_rounded))
                        ],
                      )
                    ],
                  ),
                  isThreeLine: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
