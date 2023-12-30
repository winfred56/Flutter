import 'package:flutter/material.dart';

Widget buildAnimatedText({
  required AnimationController controller,
  required String text,
  required TextStyle? textStyle,
}) {
  return AnimatedOpacity(
    opacity: controller.value,
    duration: const Duration(milliseconds: 500),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.5),
        end: Offset.zero,
      ).animate(controller),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    ),
  );
}