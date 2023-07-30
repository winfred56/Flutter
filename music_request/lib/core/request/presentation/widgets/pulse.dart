import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_request/shared/presentation/ui/navigation_helper.dart';

import '../../../user/domain/entities/user.dart';
import '../pages/search_song.dart';

class PulsingContainer extends StatefulWidget {
  const PulsingContainer({super.key,required this.dj});
  final User dj;

  @override
  State<PulsingContainer> createState() => _PulsingContainerState();
}

class _PulsingContainerState extends State<PulsingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _sizeAnimation = Tween<double>(begin: 95.0, end: 100.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return SizedBox(
                    width: _sizeAnimation.value * 2.4,
                    height: _sizeAnimation.value * 2.4,
                    child: ActionChip(
                        backgroundColor: Colors.blue.shade300,
                        elevation: 5,
                        shape: const CircleBorder(),
                        label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(CupertinoIcons.music_note,
                                size: _sizeAnimation.value * 2,
                                color: Colors.white)),
                        onPressed: () => NavigationHelper.push(context, SearchSongPage(dj: widget.dj))));
              });
        });
  }
}
