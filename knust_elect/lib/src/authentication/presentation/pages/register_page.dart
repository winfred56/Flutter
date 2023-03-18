import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';

import '../../../../core/student/data/database/student_local_database.dart';
import '../../../../core/student/domain/entities/student.dart';
import '../../../../injection_container.dart';
import '../../../../shared/ui/loader.dart';
import '../../../../shared/utils/validator.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/authentication_bloc.dart';
import 'signin_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Form key
  final formKey = GlobalKey<FormState>();

  /// Bloc Holder
  final bloc = sl<AuthenticationBloc>();

  /// Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

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
              const Text("Already Have an Account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: const Text('Sign In'))
            ]),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 90),
            child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Center(
                    child: Column(children: [
                  Text('Hello 👋 !',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(fontSizeDelta: 3, fontWeightDelta: 3),
                      textAlign: TextAlign.center),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text('Welcome, It is time to elect new leaders!',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center)),
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
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: Icon(Icons.lock)),
                                controller: passwordController)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: 'Confirm Password',
                                    suffixIcon: Icon(Icons.lock)),
                                controller: password2Controller)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: SizedBox(
                                height: media.size.height * 0.08,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (passwordController.value.text ==
                                          password2Controller.value.text) {
                                        final currentStudent =
                                            FirebaseAuth.instance;
                                        await showDialog<void>(
                                            context: context,
                                            builder: (context) => LoadingPage(
                                                errorText: Future.delayed(
                                                    const Duration(seconds: 3),
                                                    () async {
                                                  await currentStudent
                                                      .createUserWithEmailAndPassword(
                                                          email: emailController
                                                              .value.text
                                                              .trim(),
                                                          password:
                                                              password2Controller
                                                                  .value.text)
                                                      .catchError((error) {
                                                    errorMessage(error);
                                                  });
                                                  return null;
                                                }),
                                                onLoadingDone: () async {
                                                  if (currentStudent
                                                          .currentUser ==
                                                      null) {
                                                    if (!mounted) {}
                                                    errorMessage(
                                                        'Something went wrong, please try again 😢');
                                                  }
                                                  if (currentStudent
                                                          .currentUser?.uid !=
                                                      null) {
                                                    final student = Student
                                                            .initial()
                                                        .copyWith(
                                                            id: currentStudent
                                                                .currentUser!
                                                                .uid,
                                                            email:
                                                                emailController
                                                                    .value
                                                                    .text);

                                                    if (mounted) {}
                                                    await showDialog<void>(
                                                        context: context,
                                                        builder: (context) =>
                                                            LoadingPage(
                                                                errorText:
                                                                    bloc.signIn(
                                                                        student),
                                                                onLoadingDone:
                                                                    () async {
                                                                  await Navigator.pushReplacement(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const HomePage()));
                                                                },
                                                                loadingText:
                                                                    'Logging In...🎉'));

                                                    /// Store authenticated user locally
                                                    await sl<
                                                            StudentLocalDatabase>()
                                                        .save(student);
                                                  }
                                                },
                                                loadingText:
                                                    'Creating Account...🎉'));
                                      } else {
                                        return;
                                      }
                                    },
                                    child: const Text('Register'))))
                      ]))
                ])))));
  }
}
