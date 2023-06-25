import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../shared/data/image_assets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                const Text('Welcome',
                    style: TextStyle(fontSize: 42)),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('localization.signInInfo' ,
                        textAlign: TextAlign.center)),
            Form(
                key: formKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                    child: TextFormField(
                      controller: emailController,
                      // validator: Validator.email,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(
                            Ionicons.mail_open
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          // validator: Validator.password,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Ionicons.lock_closed)))),
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
                                  }
                                },
                                child: value
                                    ? const CircularProgressIndicator()
                                    : Text('localization.login',
                                    style: theme.textTheme.bodyMedium!
                                        .apply(
                                        color: theme
                                            .colorScheme.surface)));
                          }))
                ])),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Expanded(child: Divider(color: Colors.black, height: 36)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or',
                          style: theme.textTheme.bodyMedium)),
                  Expanded(
                      child: Divider(
                          color: theme.colorScheme.onBackground, height: 36))
                ]),
                SizedBox(
                    height: media.size.height * 0.07,
                    width: double.infinity,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: theme.colorScheme.primary)),
                        onPressed: () async {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                  scale: 0.5,
                                  child: Image.asset(ImageAssets.googleImage)),
                              Text('localization.googleSignup',
                                  style: theme.textTheme.bodyMedium)
                            ]))),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                SizedBox(
                  height: media.size.height * 0.07,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: theme.colorScheme.primary)),
                    onPressed: () async {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                            scale: 0.5,
                            child: Image.asset(ImageAssets.googleImage)),
                        Text('localization.appleSignup',
                            style: theme.textTheme.bodyMedium)
                      ],
                    ),
                  ),
                ),
            ]),
          ),
        ),
    ));
  }
}
