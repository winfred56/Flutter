import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';

import '../../../../core/student/data/database/student_local_database.dart';
import '../../../../injection_container.dart';
import '../../../../shared/ui/loader.dart';
import '../../../../shared/utils/validator.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/authentication_bloc.dart';
import 'register_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// Form key
  final formKey = GlobalKey<FormState>();

  /// Bloc Holder
  final bloc = sl<AuthenticationBloc>();

  /// Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// View Password
  bool _passwordVisible = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  /// Displays Error Messages
  void errorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Text(message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Theme.of(context).colorScheme.onError))));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
        bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Don't Have an Account?"),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage())),
                  child: const Text('Register Here'))
            ]),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Center(
                    child: Column(children: [
                  Text('Hello Again!',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeDelta: 3, fontWeightDelta: 3),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                        'Welcome back, It is time to elect new leaders!',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center),
                  ),
                  Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: TextFormField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                    hintText: 'email@st.knust.edu.gh',
                                    suffixIcon: Icon(Icons.mail)),
                                controller: emailController,
                                validator: Validator.email)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: TextFormField(
                                obscureText: _passwordVisible,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: _passwordVisible == false
                                        ? IconButton(
                                            onPressed: () => _toggle(),
                                            icon: const Icon(
                                                Icons.visibility_off))
                                        : IconButton(
                                            onPressed: () => _toggle(),
                                            icon:
                                                const Icon(Icons.visibility))),
                                controller: passwordController)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: SizedBox(
                              height: media.size.height * 0.08,
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (emailController.value.text != '' &&
                                        passwordController.value.text != '') {
                                      final currentStudent =
                                          FirebaseAuth.instance;
                                      Future.delayed(const Duration(seconds: 2),
                                          () async {
                                        await currentStudent
                                            .signInWithEmailAndPassword(
                                                email:
                                                    emailController.value.text,
                                                password: passwordController
                                                    .value.text).catchError((error) {
                                          errorMessage(error);
                                        });
                                      });
                                      if (currentStudent.currentUser?.uid !=
                                          null) {
                                        final student = await bloc.retrieve(
                                            currentStudent.currentUser!.uid);
                                        if (mounted) {}
                                        await showDialog<void>(
                                            context: context,
                                            builder: (context) => LoadingPage(
                                                errorText: bloc.signIn(student),
                                                onLoadingDone: () async =>
                                                    await Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const HomePage())),
                                                loadingText: 'Loading...🌀'));

                                        /// Store authenticated user locally
                                        await sl<StudentLocalDatabase>()
                                            .save(student);
                                      }
                                    }
                                  },
                                  child: const Text('Sign In'))),
                        )
                      ]))
                ])))));
  }
}
