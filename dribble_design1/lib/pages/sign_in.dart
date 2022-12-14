import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFC0CB'),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///SvgPicture
              SvgPicture.asset(
                  'assets/svgs/software.svg',
                height: MediaQuery.of(context).size.height *0.6,
              ),

              /// Sign In
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Sign In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

              /// TextFormField
              TextFormField(
                style: TextStyle(color: HexColor('#732424')),
                decoration: InputDecoration(
                  label: const Text("Email address"),
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#FFFFFF')),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

              /// Sing In button
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(HexColor('#732424'),),
                    //minimumSize:
                  ),
                    onPressed: () => Navigator.pushNamed(context, '/notifications'),
                    child: const Text("Continue", style: TextStyle(fontSize: 20, ),),),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20),),

              /// Create account
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New User?"),
                  TextButton(onPressed: (){},
                      child: const Text("Create an account"),)
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
