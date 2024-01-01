import 'package:flutter/material.dart';
import 'package:untitled_botr/src/posts/presentation/widgets/postCard.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: NestedScrollView(
          controller: widget.scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          [SliverAppBar(
            snap: true, floating: true, automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.5),
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ActionChip(
                      shape: CircleBorder(), label: Icon(Icons.notifications)),
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade200,
                  ),
                ],
              )
            ],
            leadingWidth: 180,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(),
                Text(
                  'Morning, Pearl',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )],
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(54, 32, 93, .3)),
                  child: Column(
                    children: [
                      Align(alignment: Alignment.centerLeft,
                        child: Text(
                          'How are you doing today?',
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                          'We are always available if you need any support or advice.',
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodySmall),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Get Support'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: true, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: false, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: false, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: false, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: true, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: false, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: false, viewedInDetail: false),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const PostCard(hasVideo: true, viewedInDetail: false),
              ],
            ),
          ),
        
        ),
      ),
    );
  }
}
