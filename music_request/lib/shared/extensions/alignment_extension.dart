import 'package:flutter/material.dart';

extension AlignmentExtension on Widget {
  Widget center() => Align(
        alignment: Alignment.center,
        child: this,
      );

  Widget left() => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  Widget right() => Align(
        alignment: Alignment.centerRight,
        child: this,
      );
}
