import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../shared/data/image_assets.dart';
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
                        ValueListenableBuilder<File?>(
                            valueListenable: selectedImage,
                            builder: (context, imageFile, _) {
                              if (imageFile != null) {
                                return CircleAvatar(
                                  radius: 90,
                                  backgroundImage: FileImage(imageFile),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: ActionChip(
                                          backgroundColor:
                                              theme.colorScheme.primary,
                                          label: Icon(Icons.edit_rounded,
                                              size: 14,
                                              color:
                                                  theme.colorScheme.onPrimary),
                                          shape: const CircleBorder(),
                                          onPressed: () async {
                                            final imageFile = await chooseImage(
                                                ImageSource.gallery);
                                            if (imageFile != null) {
                                              selectedImage.value = imageFile;
                                            }
                                          })),
                                );
                              } else {
                                return CircleAvatar(
                                    radius: 90,
                                    onBackgroundImageError: (context, error) =>
                                        ImageAssets.imagePlaceholder,
                                    backgroundImage: NetworkImage(value.photo),
                                    backgroundColor: Colors.grey,
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: ActionChip(
                                            backgroundColor:
                                                theme.colorScheme.primary,
                                            label: Icon(Icons.edit_rounded,
                                                size: 14,
                                                color: theme
                                                    .colorScheme.onPrimary),
                                            shape: const CircleBorder(),
                                            onPressed: () async {
                                              final imageFile =
                                                  await chooseImage(
                                                      ImageSource.gallery);
                                              if (imageFile != null) {
                                                selectedImage.value = imageFile;
                                              }
                                            })));
                              }
                            }),
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Full Name',
                                              style: theme.textTheme.labelLarge!
                                                  .apply(
                                                      fontWeightDelta: 1,
                                                      fontSizeDelta: 2)))),
                                  TextFormField(
                                      controller: fullNameController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          suffixIcon:
                                              Icon(CupertinoIcons.person_alt),
                                          hintText: 'Full Name'),
                                      validator: Validator.name),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Username',
                                              style: theme.textTheme.labelLarge!
                                                  .apply(
                                                      fontWeightDelta: 1,
                                                      fontSizeDelta: 2)))),
                                  TextFormField(
                                      controller: userNameController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          suffixIcon: Icon(CupertinoIcons.at),
                                          hintText: 'Username'),
                                      validator: Validator.username),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 5),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Phone Number',
                                              style: theme.textTheme.labelLarge!
                                                  .apply(
                                                      fontWeightDelta: 1,
                                                      fontSizeDelta: 2)))),
                                  IntlPhoneField(
                                      validator: (phoneNumber) =>
                                          Validator.phoneNumber(
                                              phoneNumber?.number),
                                      controller: phoneNumberController,
                                      disableLengthCheck: true,
                                      decoration: const InputDecoration(
                                        hintText: 'Phone Number',
                                        suffixIcon:
                                            Icon(CupertinoIcons.phone_fill),
                                      ),
                                      initialCountryCode: 'GH')
                                ]))),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Date Of Birth',
                                    style: theme.textTheme.labelLarge!.apply(
                                        fontWeightDelta: 1,
                                        fontSizeDelta: 2)))),
                        TextFormField(
                            onTap: () => _selectDate(context),
                            readOnly: true,
                            validator: Validator.dateOfBirth,
                            controller: dateOfBirthController,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(CupertinoIcons.calendar_today),
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
                                      String? imageUrl;
                                      imageUrl = selectedImage.value != null
                                          ? await uploadImage(
                                              selectedImage.value!)
                                          : null;
                                      final updatedUserDetails = value.copyWith(
                                          phoneNumber:
                                              phoneNumberController.text,
                                          username: userNameController.text,
                                          dateOfBirth:
                                              DateFormatter.convertToDateTime(
                                                      dateOfBirthController
                                                          .text)
                                                  .toString(),
                                          photo: imageUrl ??
                                              localUserDetails.value.photo,
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
                                                      .textTheme.labelLarge!
                                                      .apply(
                                                          fontSizeDelta: 2,
                                                          color: theme
                                                              .colorScheme
                                                              .surface));
                                        }))))
                      ]);
                    })))));
  }
}
