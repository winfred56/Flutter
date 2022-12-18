import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mini_shop/core/user/presentation/bloc/user_bloc.dart';
import 'package:mini_shop/user_info.dart';

import 'injection_container.dart';
import 'core/user/domain/use_cases/register.dart';

class SignUpPage extends StatefulWidget {

  const SignUpPage({Key? key,}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Bloc
  final bloc = sl<UserBloc>();

  /// Tracks form state
  final formKey = GlobalKey<FormState>();

  /// For editing password field
  final passwordController = TextEditingController();

  /// For editing email field
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
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
                  'Register Today !',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),

              /// TextFormField
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: HexColor('#732424')),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#FFFFFF')),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Email 📧',
                      ),
                      controller: emailController,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5),),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(color: HexColor('#732424')),
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#FFFFFF')),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password 🔐',
                      ),
                      controller: passwordController,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),

                    /// Sing In button
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                          //minimumSize:
                        ),
                        onPressed: () async {
                          formKey.currentState?.validate();
                          // await bloc.registerUser(RegisterParams(
                          //     emailController.value.text, passwordController.value.text));
                          setState(() {
                            //Navigator.pushNamed(context, '/user_info');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserInformation(email: emailController.value.text, password: passwordController.value.text),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          "Register 🎊",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have an Account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
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
