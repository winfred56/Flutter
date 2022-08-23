import 'package:flutter/material.dart';
import 'package:voting_demo/commonWidgets/loader.dart';
import 'package:voting_demo/screens/Authentications/auth_widgets/header_widget.dart';

import 'auth_widgets/formDecor.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  /// Instance of Formstate
  final _formkey = GlobalKey<FormState>();


  /// variables to hold login data
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final double _headerHeight = 250;

  // Instance of the AuthenticationService Class
  //final AuthenticationService _auth = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign In into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          child: Column(
                            children: [
                              const SizedBox(height: 20.0,),
                              TextFormField(
                                decoration: LoginFormStyle.formDecoration.copyWith(hintText: "Email@st.knust.edu.gh"),
                                validator: (val) => val!.endsWith('@st.knust.edu.gh') ? null : "Enter a valid Email address",
                                onChanged: (val){
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                              const SizedBox(height: 20,),
                              TextFormField(
                                decoration: LoginFormStyle.formDecoration.copyWith(hintText: "Password"),
                                obscureText: true,
                                validator: (val)=> val!.length < 4 ? 'Enter a valid password' : null,
                                onChanged: (val){
                                  setState(() {
                                    password = val;

                                  });
                                },
                              ),
                            ],
                          )),
                      ElevatedButton(
                        style:ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(99, 12, 12, 80)),
                        ),
                        onPressed: ()async{
                          _formkey.currentState?.validate() ?? setState((){
                            loading = true;
                            // print(email);
                            // print(password);
                          });
                          //dynamic results = await _auth.signInWithEmailAndPassword(email, password);
                          //print(results);
                          // if(results == null){
                          //   setState((){
                          //     loading = false;
                          //     error = 'Enter valid Credentials';
                          //   });

                          //}
                          },
                        child: const Text('Sign In'),
                      ),
                      Text(error,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16.0
                        ),
                      ),
                      const SizedBox(height: 90,),
                      TextButton(onPressed: (){},
                          child: TextButton.icon(onPressed: (){}, //=> widget.toggleView()
                            icon: const Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.black,
                          ),
                              label: const Text("Create an account"))

                      )],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
