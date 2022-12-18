import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'injection_container.dart';
import 'core/user/domain/use_cases/update.dart';
import 'core/user/presentation/bloc/user_bloc.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key, required String email, required String password}) : super(key: key);

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  /// Bloc
  final bloc = sl<UserBloc>();

  /// Tracks form state
  final formKey = GlobalKey<FormState>();
  /// For editing Username Field
  TextEditingController  usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/svgs/celebration.svg'),
                    const Text(
                      'Welcome 🤝',
                      style:
                          TextStyle(fontSize: 46, fontWeight: FontWeight.w600),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      child: Text(
                        'Provide the following information to complete your Account',
                        style: TextStyle(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFormField(
                      //controller: usernameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Username',
                        hintText: 'Enter Username',
                      ),
                    ),


                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                    ),

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
                          await bloc.update(user);
                          setState(() {
                            //Navigator.pushNamed(context, '/user_info');
                          });
                        },
                        child: const Text(
                          "Finish 💯",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
