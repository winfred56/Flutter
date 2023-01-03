import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../home/presentation/pages/home_page.dart';
import 'sign_in.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Check if user is logged in display the Home else Log in or Sign up page screen
    final user = Provider.of<firebase_auth.User?>(context);
    if (user == null){
      return const SignInPage();
    }else{
      return const HomePage();
    }

  }
}