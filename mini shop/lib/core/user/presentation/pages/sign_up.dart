import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mini_shop/core/user/presentation/bloc/user_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/use_cases/register.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                height: MediaQuery.of(context).size.height *0.4,
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
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

                    /// Sing In button
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black87,),
                          //minimumSize:
                        ),
                        onPressed: () async{
                          await bloc.registerUser(RegisterParams(emailController.text, passwordController.text));
                          print('Using bloc.registerUser to Register User');
                        },
                        child: const Text("Continue", style: TextStyle(fontSize: 20, ),),),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

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
