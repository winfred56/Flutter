import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(99, 12, 12, 100),
        body: Center(
            child: SpinKitChasingDots(
                color: HexColor('#732424'),
                size: 50.0
            )
        )
    );
  }
}