import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../shared/utils/date_formatter.dart';
import '../../../../shared/utils/validator.dart';
import '../../domain/entities/user.dart';
import '../logic/user_logic.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> with UserLogic {
  /// Form key
  final formKey = GlobalKey<FormState>();

  /// Controllers
  TextEditingController fullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  /// Loading Notifier
  final loading = ValueNotifier<bool>(false);

  /// User Details Notifier
  final localUserDetails = ValueNotifier(User.initial());

  /// selected Date Notifier
  ValueNotifier<DateTime> selectedDateNotifier =
      ValueNotifier<DateTime>(DateTime.now());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1890),
      lastDate: DateTime(2010),
    );

    if (pickedDate != null && pickedDate != selectedDateNotifier.value) {
      selectedDateNotifier.value = pickedDate;
      dateOfBirthController.text =
          DateFormatter.shortDate(selectedDateNotifier.value.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      localUserDetails.value = await bloc.getAuthenticatedUser();
      phoneNumberController.text =
          localUserDetails.value.phoneNumber.substring(1);
      userNameController.text = localUserDetails.value.username;
      fullNameController.text = localUserDetails.value.fullName;
      dateOfBirthController.text =
          DateFormatter.shortDate(localUserDetails.value.dateOfBirth);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Update Profile')),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: SingleChildScrollView(
                child: ValueListenableBuilder(
                    valueListenable: localUserDetails,
                    builder: ((context, value, _) {
                      return Column(children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Full Name',
                                              style: theme
                                                  .textTheme.headlineSmall!
                                                  .apply(fontWeightDelta: 1)))),
                                  TextFormField(
                                      controller: fullNameController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          suffixIcon: Icon(Ionicons.person),
                                          hintText: 'Full Name'),
                                      validator: Validator.name),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Username',
                                              style: theme
                                                  .textTheme.headlineSmall!
                                                  .apply(fontWeightDelta: 1)))),
                                  TextFormField(
                                      controller: userNameController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.alternate_email),
                                          hintText: 'Username'),
                                      validator: Validator.username),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Phone Number',
                                              style: theme
                                                  .textTheme.headlineSmall!
                                                  .apply(fontWeightDelta: 1)))),
                                  IntlPhoneField(
                                      validator: (phoneNumber) =>
                                          Validator.phoneNumber(
                                              phoneNumber?.number),
                                      controller: phoneNumberController,
                                      disableLengthCheck: true,
                                      decoration: const InputDecoration(
                                          hintText: 'Phone Number',
                                          suffixIcon: Icon(Ionicons.call),
                                          ),
                                      initialCountryCode: 'GH')
                                ]))),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Date Of Birth',
                                    style: theme.textTheme.headlineSmall!
                                        .apply(fontWeightDelta: 1)))),
                        TextFormField(
                            onTap: () => _selectDate(context),
                            readOnly: true,
                            validator: Validator.dateOfBirth,
                            controller: dateOfBirthController,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.cake),
                                hintText: 'Date Of Birth')),
                        Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: SizedBox(
                                height: media.size.height * 0.07,
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      /// Do validation
                                      formKey.currentState!.save();
                                      if (!formKey.currentState!.validate()) {
                                        return;
                                      }
                                      loading.value = true;
                                      final updatedUserDetails = value.copyWith(
                                          phoneNumber:
                                              '0${phoneNumberController.text}',
                                          username: userNameController.text,
                                          dateOfBirth:
                                              DateFormatter.convertToDateTime(
                                                      dateOfBirthController
                                                          .text)
                                                  .toString(),
                                          fullName: fullNameController.text);
                                      if (mounted) {
                                        updateProfile(context,
                                            updatedUserDetails, loading);
                                      }
                                    },
                                    child: ValueListenableBuilder<bool>(
                                        valueListenable: loading,
                                        builder: (context, loading, child) {
                                          return loading
                                              ? CircularProgressIndicator(
                                                  color: theme
                                                      .colorScheme.onPrimary)
                                              : Text('Save',
                                                  style: theme
                                                      .textTheme.headlineSmall!
                                                      .apply(
                                                          color: theme
                                                              .colorScheme
                                                              .surface));
                                        }))))
                      ]);
                    })))));
  }
}