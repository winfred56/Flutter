import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../shared/data/image_assets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
                child: Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 60)),
              const Center(child: Icon(Ionicons.cloud, size: 160)),
              const Text('Save your Requests',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text('Access your Requests, all in one place',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey)),
              const Spacer(),
              SizedBox(
                  height: media.size.height * 0.07,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                                scale: 0.5,
                                child: Image.asset(ImageAssets.googleImage)),
                            const Spacer(),
                            const Text('Sign in with Google',
                                style: TextStyle(color: Colors.black)),
                            const Spacer()
                          ]))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              SizedBox(
                  height: media.size.height * 0.07,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                                scale: 0.5,
                                child: const Icon(
                                  Ionicons.mail,
                                  size: 50
                                )),
                            const Spacer(),
                            const Text('Sign in with Google'),
                            const Spacer()
                          ]))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5))
            ]))));
  }
}
