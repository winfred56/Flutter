import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final bool hasVideo;
  final bool viewedInDetail;
  const PostCard(
      {Key? key,
        required this.hasVideo,
        required this.viewedInDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          /// Post profile info
          if (!viewedInDetail) _buildPostDetailsRow(context),

          /// Post Content
          InkWell(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const PostDetail()));
              // },
              child: _buildPostContent(context)),

          if (hasVideo) _buildPostWithVideo(context),

          // /// Posted by or written by
          // if (!viewedInDetail) _buildPostBy(context),
          // if(viewedInDetail) _buildReward(context),

          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),

          /// Post comments, interactions, share
          _buildPostStatsRow(context),

        ]));
  }


  // Widget _buildTrendingRow(BuildContext context) {
  //   return Column(children: [
  //     Row(children: [
  //       Text('Trending',
  //           style: Theme.of(context)
  //               .textTheme
  //               .bodyLarge
  //               ?.copyWith(fontWeight: FontWeight.w700)),
  //       const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
  //       Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(2),
  //               border: Border.all(width: 0.5, color: Colors.grey.shade300)),
  //           child: const Icon(Icons.arrow_forward_ios_rounded, size: 16))
  //     ]),
  //     const Divider()
  //   ]);
  // }

  Widget _buildPostDetailsRow(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          const CircleAvatar(backgroundColor: Colors.orange),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Who you are in Jesus',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text('Anxiety', textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall)
          ],)
        ]),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, size: 16))
      ]),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2))
    ]);
  }

  Widget _buildPostContent(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc placerat semper arcu, at placerat libero pharetra et. Maecenas sed purus at arcu mattis finibus ut eget augue.',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }

  Widget _buildPostWithVideo(BuildContext context) {
    return Column(children: [
      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
      Container(
          height: 120,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12)),
          child: Stack(children: [
            Container(height: 120),
            const Align(
                alignment: Alignment.center,
                child: Icon(Icons.play_circle_fill_rounded))
          ]))
    ]);
  }

  // Widget _buildPostBy(BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 4.0),
  //       child: Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text('by coochieforbreakfast  •  7h',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .bodySmall
  //                   ?.copyWith(color: Colors.grey.shade600))));
  // }

  // Widget _buildReward(BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 4.0),
  //       child: Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text('🚀 • 1 reward',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .bodySmall
  //                   ?.copyWith(color: Colors.grey.shade600))));
  // }

  Widget _buildPostStatsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBookmarkRow(context),
        _buildCommentRow(context),
        _buildLikeRow(context),
        _buildShareRow(context),
      ],
    );
  }

  Widget _buildBookmarkRow(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(Icons.bookmark_border,
              size: 16, color: Colors.grey.shade700),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text('1,234', style: _getTextStyle(context)),
        ]));
  }

  Widget _buildCommentRow(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(Icons.messenger_outline_rounded,
              size: 16, color: Colors.grey.shade700),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text('3k', style: _getTextStyle(context))
        ]));
  }

  Widget _buildLikeRow(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(Icons.favorite_border,
              size: 16, color: Colors.grey.shade700),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text('13k', style: _getTextStyle(context))
        ]));
  }

  Widget _buildShareRow(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(Icons.share, size: 16, color: Colors.grey.shade700),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
          Text('Share', style: _getTextStyle(context))
        ]));
  }

  TextStyle _getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w700, color: Colors.grey.shade700) ??
        const TextStyle();
  }
}
