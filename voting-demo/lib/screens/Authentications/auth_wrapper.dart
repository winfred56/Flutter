import 'package:flutter/material.dart';
import 'package:voting_demo/screens/Authentications/login.dart';
import 'package:voting_demo/screens/Authentications/register.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return Login(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }

  }
}
