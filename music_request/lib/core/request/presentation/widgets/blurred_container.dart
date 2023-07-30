import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../user/domain/entities/user.dart';


class BlurredContainer extends StatelessWidget {
  const BlurredContainer({super.key, required this.dj});
  final User dj;

  @override
  Widget build(BuildContext context) {
    return Container(child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(dj.photo),
                      fit: BoxFit.cover
                  )
              )
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              )
          ),
          Center(child: Text('Profile'))
        ]
    ),);
  }
}
