import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/remote_datasource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Form Controller
  final formKey = GlobalKey<FormState>();

  /// email Controller
  TextEditingController emailController = TextEditingController();

  /// password Controller
  TextEditingController passwordController = TextEditingController();

  /// Authenticator Instance
  final AuthenticateUsers _authenticator =  AuthenticateUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///SvgPicture
              SvgPicture.asset(
                'assets/svgs/software.svg',
                height: MediaQuery.of(context).size.height * 0.5,
              ),

              /// Sign In
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign In 🔐',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email Address'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .7),
                        ),
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: .7),
                        ),
                      ),
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),

                    /// Sign In button
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            HexColor('#732424'),
                          ),
                          //minimumSize:
                        ),
                        onPressed: () {
                          /// Log user in
                          _authenticator.logInWithEmailAndPassword(emailController.value.text, passwordController.value.text);
                        },
                        child: const Text(
                          "Login 🎉",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signup'),
                          child: const Text('Register'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
