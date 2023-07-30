import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideBarGridPattern extends StatelessWidget {
  const SideBarGridPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
              color: index % 2 == 0 ? Colors.blue.shade200 : Colors.amber.shade200
          );
        }
    );
  }
}


final List<IconData> customIcons = [
  CupertinoIcons.circle,
  CupertinoIcons.square,
  CupertinoIcons.star,
  CupertinoIcons.hexagon,
  CupertinoIcons.heart,
];

class GridPattern extends StatelessWidget {
  const GridPattern({super.key});

  @override
  Widget build(BuildContext context) {
    final int numRows = Random().nextInt(4) + 2;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
        itemCount: numRows * 5,
     // itemCount: customIcons.length,
      itemBuilder: (context, index) {
        final randomIconIndex = Random().nextInt(customIcons.length);
        return Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: index % 2 == 0 ? Colors.blue : Colors.red,
          ),
          child: Icon(
              customIcons[randomIconIndex],
            size: 24,
            color: Colors.black
          )
        );
      }
    );
  }
}
