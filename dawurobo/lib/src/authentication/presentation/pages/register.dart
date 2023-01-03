import 'package:dawurobo/core/user/data/data_sources/local_database.dart';
import 'package:dawurobo/core/user/domain/entities/user.dart';
import 'package:dawurobo/src/authentication/presentation/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/user/presentation/bloc/user_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../shared/ui/loader.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  /// Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Form Controller
  final formKey = GlobalKey<FormState>();

  final bloc = sl<UserBloc>();

  final firebase_auth.FirebaseAuth  _auth = firebase_auth.FirebaseAuth.instance;

  Future<String> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      final currentUser = firebase_auth.FirebaseAuth.instance.currentUser;
      if(currentUser?.uid != '' && currentUser?.email != '') {
        final profile = User.initial().copyWith(
            id: currentUser!.uid,
            email: emailController.value.text.trim()
        );
        await bloc.newSignIn(profile);
        await sl<UserLocalDatabase>().save(profile);
        setState(() {});
      }
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
                'assets/svgs/contact.svg',
                height: MediaQuery.of(context).size.height * 0.5,
              ),

              /// Sign In
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Join Us Today!',
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
                                  errorText: register(
                                      emailController.value.text.trim(),
                                      passwordController.value.text),
                                  onLoadingDone: () async {
                                    setState(() {});
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
                  const Text("Already have an Account?"),
                  TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage())),
                    child: const Text("Login"),
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
