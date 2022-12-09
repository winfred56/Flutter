import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/remote_datasource.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                'assets/svgs/2.svg',
                height: MediaQuery.of(context).size.height * 0.5,
              ),

              /// Sign In
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register Today! 🗞',
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
                          /// Register a new User
                          _authenticator.registerWithEmailAndPassword(emailController.value.text, passwordController.value.text);
                        },
                        child: const Text(
                          "Register 🎉",
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
                              Navigator.pushNamed(context, '/login'),
                          child: const Text('Login'),
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
