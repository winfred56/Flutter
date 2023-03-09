import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../onboarding/presentation/pages/onboarding_page.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Bloc Holder
  final bloc = sl<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                await bloc.logOUt();
                if (mounted){}
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const OnboardingPage()));
              },
              child: const Text('Logout'))),
    );
  }
}
