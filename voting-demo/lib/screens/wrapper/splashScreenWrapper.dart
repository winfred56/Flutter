import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voting_demo/screens/Authentications/login.dart';
import 'package:voting_demo/screens/Authentications/register.dart';

import 'mainWrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/splash.png',),
      title:  Text(
        "ELECT",
        style: TextStyle(
          fontSize: 67,
          fontWeight: FontWeight.bold,
          color: HexColor('#732424'),
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text(
        "Loading...",
        style: TextStyle(
            color: HexColor('#732424')
        ),
      ),
      navigator: const MainWrapper(),
      durationInSeconds: 3,
    );
  }
}
