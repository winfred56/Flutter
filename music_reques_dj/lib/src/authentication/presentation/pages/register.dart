import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../shared/utils/validator.dart';
import '../logic/auth_logic.dart';
import 'sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AuthLogic {
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
              child: Column(children: [
                const Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        height: media.size.height * 0.09,
                        width: media.size.height * 0.09,
                        child: const Icon(CupertinoIcons.circle_grid_3x3,
                            color: Colors.white))),
                const Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Welcome', style: TextStyle(fontSize: 48)))),
                const Align(alignment: Alignment.centerLeft,
                  child: Text(
                      'Sign up to continue', style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left),
                ),
                Form(
                    key: formKey,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                          child: TextFormField(

                              controller: emailController,
                              validator: Validator.email,
                              decoration: const InputDecoration(
                                  hintText: 'EMAIL',
                                  prefixIcon: Icon(CupertinoIcons.mail_solid)))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: TextFormField(
                              obscureText: true,
                              controller: passwordController,
                              validator: Validator.password,
                              decoration: const InputDecoration(
                                  hintText: 'PASSWORD',
                                  prefixIcon: Icon(CupertinoIcons.lock_fill)))),
                      SizedBox(
                          height: media.size.height * 0.07,
                          width: double.infinity,
                          child: ValueListenableBuilder<bool>(
                              valueListenable: loading,
                              builder: (context, value, child) {
                                return ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        loading.value = true;
                                        register(
                                            emailController.text.trim(),
                                            passwordController.text,
                                            context,
                                            loading);
                                      }
                                    },
                                    child: value
                                        ? const CircularProgressIndicator(
                                        color: Colors.white)
                                        : Text('Sign Up',
                                        style: theme.textTheme.bodyMedium!
                                            .apply(
                                            color: theme
                                                .colorScheme.surface)));
                              }))
                    ])),
                //  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextButton(onPressed: () => NavigationHelper.push(context, SignInPage()), child: const Text('Already have an account?  LOGIN'))
              ]),
            )));
  }
}
