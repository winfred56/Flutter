import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../shared/data/image_assets.dart';
import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../authentication/presentation/logic/auth_logic.dart';
import '../../../authentication/presentation/pages/sign_in.dart';

class OnboardingPage extends StatelessWidget with AuthLogic {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
                child: Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 60)),
              const Center(child: Icon(CupertinoIcons.cloud_fog_fill, size: 160, color: Colors.blue)),
              const Text('Request your favorite song',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text('Access your Requests, all in one place.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey)),
              const Spacer(),
              SizedBox(
                  height: media.size.height * 0.07,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () => continueWithGoogle(context),
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
                      onPressed: () => NavigationHelper.push(context, SignInPage()),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                                scale: 0.5,
                                child: const Icon(
                                  CupertinoIcons.mail_solid,
                                  size: 50
                                )),
                            const Spacer(),
                            const Text('Sign in with Email'),
                            const Spacer()
                          ]))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5))
            ]))));
  }
}
