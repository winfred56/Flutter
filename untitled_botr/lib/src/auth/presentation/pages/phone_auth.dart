import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:untitled_botr/shared/presentation/extensions.dart';
import 'package:untitled_botr/shared/presentation/router.dart';
import 'package:untitled_botr/src/auth/presentation/pages/otp.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier<bool>(false);
  final PhoneNumber _number = PhoneNumber(isoCode: 'GB');
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isButtonEnabled.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign in or Log in to BOTR',
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get Started!',
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                'Enter your phone number. We will send you a confirmation code there.',
                style: theme.textTheme.bodySmall,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                  //_isButtonEnabled.value = _formKey.currentState?.validate() ?? false;
                },
                onInputValidated: (bool value) {
                  print(value);
                  _isButtonEnabled.value = value;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: _number,
                textFieldController: _phoneNumberController,
                formatInput: true,
                maxLength: 11,
                spaceBetweenSelectorAndTextField: 0,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('Saved PhoneNumber: $number');
                },
              ),
              const Spacer(),
              ValueListenableBuilder<bool>(
                valueListenable: _isButtonEnabled,
                builder: (context, isEnabled, child) {
                  return SizedBox(
                      width: double.infinity,
                      child: ElevatedButtonWithLoading.createWithLoading(
                          onPressed: isEnabled
                              ? () async {
                                  // Start your logic here
                                  _isLoading.value = true;

                                  _formKey.currentState?.save();
                                  // Simulate some async operation
                                  await Future.delayed(
                                      const Duration(seconds: 2));

                                  // End your logic here
                                  _isLoading.value = false;
                                  // CustomPageRouteBuilder(const ListPage());
                                  if (mounted) {
                                    Navigator.push(
                                        context,
                                        CustomPageRouteBuilder(
                                            const OtpPage()));
                                    //CustomPageRouteBuilder(const ListPage());
                                  }
                                }
                              : null,
                          isLoading: _isLoading,
                          child: const Text('Validate')));
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4))
            ],
          ),
        ),
      ),
    );
  }
}
