import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../shared/utils/validator.dart';
import '../logic/auth_logic.dart';
import 'register.dart';

class SignInPage extends StatelessWidget with AuthLogic {
  SignInPage({Key? key}) : super(key: key);

  /// Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  /// Loading Notifier
  final loading = ValueNotifier<bool>(false);

  /// Form Key
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(children: [
                      const Text('Welcome', style: TextStyle(fontSize: 42)),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Sign in to Music Request And Lets Fun.',
                              textAlign: TextAlign.center)),
                      Form(
                          key: formKey,
                          child: Column(children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, bottom: 10),
                                child: TextFormField(
                                    controller: emailController,
                                    validator: Validator.email,
                                    decoration: const InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(CupertinoIcons.mail_solid)))),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    validator: Validator.password,
                                    decoration: const InputDecoration(
                                        hintText: 'Password',
                                        prefixIcon:
                                            Icon(CupertinoIcons.lock_fill)))),
                            SizedBox(
                                height: media.size.height * 0.07,
                                width: double.infinity,
                                child: ValueListenableBuilder<bool>(
                                    valueListenable: loading,
                                    builder: (context, value, child) {
                                      return ElevatedButton(
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              loading.value = true;
                                              signIn(
                                                  emailController.text.trim(),
                                                  passwordController.text,
                                                  context,
                                                  loading);
                                            }
                                          },
                                          child: value
                                              ? const CircularProgressIndicator(color: Colors.white)
                                              : Text('Sign in',
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .apply(
                                                          color: theme
                                                              .colorScheme
                                                              .surface)));
                                    }))
                          ])),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      TextButton(onPressed: () => NavigationHelper.push(context, const RegisterPage()), child: const Text('Don\'t have an account?  REGISTER'))

                    ])))));
  }
}
