import 'package:flutter/material.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/signup_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //SvgPicture.asset('assets/svgs/1.svg'),
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
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(onPressed: ()=> const SignUpPage(), child: const Text('Sign Up'),)
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
