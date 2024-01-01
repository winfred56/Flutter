import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled_botr/shared/presentation/extensions.dart';
import 'package:untitled_botr/shared/presentation/router.dart';
import 'package:untitled_botr/src/auth/presentation/widgets/pinInput.dart';

import '../../../profile/tellUsAboutYou.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isComplete = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
        title: Text(
          'Sign in or Log in to BOTR',
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Verify phone number',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                    text:
                        'For your security we need to ensure it\'s really you.\nPlease enter the 6-digit we sent to ',
                    style: theme.textTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: '+233 201 174 285\n',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: 'This code expires in 30 mins'),
                    ]),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            CustomPinInputField(onComplete: (String value) {
              if (kDebugMode) print(value);
              // _isLoading.value = true;
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Didn\'t receive it? Resend code',
                      style: theme.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600))),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButtonWithLoading.createWithLoading(
                  onPressed: () async {
                    _isLoading.value = true;
                    await Future.delayed(const Duration(seconds: 2));
                    _isLoading.value = false;
                    if (mounted) {
                      Navigator.push(context,
                          CustomPageRouteBuilder(const TellUsAboutYou()));
                    }
                  },
                  isLoading: _isLoading,
                  child: const Text('Verify phone number')),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4))
          ],
        ),
      ),
    );
  }
}
