import 'package:dawurobo/src/authentication/presentation/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../shared/ui/loader.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Form Controller
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return result.toString();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
        return error.toString();
      }
    }
    return '';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                  'Sign In',
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
                      style: TextStyle(color: HexColor('#732424')),
                      decoration: InputDecoration(
                        label: const Text("Email address"),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#FFFFFF')),
                        ),
                      ),
                      controller: emailController,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(color: HexColor('#732424')),
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#FFFFFF')),
                        ),
                      ),
                      controller: passwordController,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown
                          ),
                        onPressed: () async {
                          /// Don't validate if form is not valid
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          await showDialog<void>(
                              context: context,
                              builder: (context) => LoadingPage(
                                  errorText: signIn(
                                      emailController.value.text.trim(),
                                      passwordController.value.text),
                                  onLoadingDone: () async {
                                    // await sl<UserLocalDatabase>()
                                    //     .save(updatedDetails);
                                    // userDetails.value =
                                    //     updatedDetails;
                                  },
                                  loadingText: 'Logging in ...🎉'));
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New User?"),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
                    child: const Text("Create an account"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
