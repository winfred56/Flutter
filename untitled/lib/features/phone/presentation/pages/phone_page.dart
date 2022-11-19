import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled/features/phone/presentation/pages/trial_page.dart';

import '../../../../injection_container.dart';
import '../bloc/phone_bloc.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final bloc = sl<SignInBloc>();

  /// Form Controller
  final formKey = GlobalKey<FormState>();

  ///  Phone number controller
  late TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Shop With Us',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'We will send you a verification code to your number.',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 15),
              child: Form(
                key: formKey,
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    alignLabelWithHint: true,
                    filled: true,
                  ),
                  flagsButtonPadding:
                      const EdgeInsets.symmetric(horizontal: 15),
                  initialCountryCode: 'GH',
                  countries: const ['GH', 'NG', 'KE'],
                  controller: phoneNumberController,
                ),
              ),
            ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {

              /// Don't validate if form is not valid
              if (!formKey.currentState!.validate()) {
                return;
              }
              await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 5),
                            () {
                          Navigator.of(context).pop(true);
                        });
                    return AlertDialog(
                      icon: const Icon(
                        Icons.security,
                        size: 60,
                      ),
                      iconColor: Colors.blue,
                      title: const Text(
                          'Sending Confirmation ...'),
                      content: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: const <Widget>[
                            CircularProgressIndicator
                                .adaptive(),
                          ]),
                    );
                  });


              /// Call firebase if form is valid
              return FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,

                  /// Auto Detects otp code
                  verificationCompleted: (PhoneAuthCredential
                  credentials) async {
                    await FirebaseAuth.instance
                        .signInWithCredential(credentials);
                  },
                  verificationFailed:
                      (FirebaseException error) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .error,
                        content: Text(
                          error.code,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onError,
                          ),
                        ),
                      ),
                    );
                  },

                  /// Handles phone verification
                  codeSent:
                      (verificationId, resendToken) async {
                    /// Open OTP Form
                    final code =
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => TestPage(
                        //phoneNumber: phoneNumberController.text,
                      ),
                    );

                    /// Handles invalid OTP
                    if (code == null) {
                      //showSubmitButton.value = true;
                      if (!mounted) {}
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .error,
                          content: Text(
                            'Something went wrong, please try again 😢',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onError,
                            ),
                          ),
                        ),
                      );
                    }

                    /// Create authentication credentials
                    PhoneAuthCredential credentials =
                    PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: code,
                    );

                    /// Authenticate User
                    await FirebaseAuth.instance
                        .signInWithCredential(credentials)
                        .catchError(
                          (error) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .error,
                            content: Text(
                              error.code,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .apply(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onError,
                              ),
                            ),
                          ),
                        );
                        //showSubmitButton.value = true;
                      },
                    );

                    /// Get authenticated user
                    final currentUser =
                        FirebaseAuth.instance.currentUser;

                    if (currentUser == null) {
                      //showSubmitButton.value = true;
                      if (!mounted) {}
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .error,
                          content: Text(
                            'Something went wrong, please try again 😢',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onError,
                            ),
                          ),
                        ),
                      );
                    }
                  },

                  /// Handles timeout
                  codeAutoRetrievalTimeout: (timeOut) {});
            },
            icon: const Icon(Icons.check),
            label: Text(
              'Continue',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
