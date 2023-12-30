import 'package:flutter/material.dart';

Widget buildBackground() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/static/onboard2.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.925),
            Colors.black.withOpacity(0.95),
            Colors.black,
          ],
        ),
      ),
    ),
  );
}