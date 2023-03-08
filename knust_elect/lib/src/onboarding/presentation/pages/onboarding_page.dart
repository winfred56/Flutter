import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../shared/data/image_assets.dart';
import '../../../authentication/presentation/pages/register_page.dart';
import '../../../authentication/presentation/pages/signin_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: media.size.width * 0.42,
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage())),
                      child: const Text('Register'))),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              SizedBox(
                  width: media.size.width * 0.42,
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage())),
                      child: const Text('Sign In')))
            ])),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(children: [
                  ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                              width: double.infinity,
                              height: media.size.height * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade200.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child:
                                      Image.asset(ImageAssets.onboadrding))))),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 40)),
                  Text('Vote for your',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeDelta: 3, fontWeightDelta: 3)),
                  Text('Favorite SRC candidate',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeDelta: 3, fontWeightDelta: 3)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: Text(
                          'Discover all the src candidates here and vote for your favorite',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center))
                ]))));
  }
}
