import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../../../injection_container.dart';
import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../data/database/user_local_database.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';

mixin UserLogic {
  // /// Bloc
  // final bloc = sl<UserBloc>();
  //
  // /// Firebase Instance
  // final firebase = FirebaseAuth.instance;
  //
  // Future<void> signOut(BuildContext context) async {
  //   await firebase.signOut();
  //   await bloc.logOUt().then((value) => NavigationHelper.pushAndRemoveUntilPage(
  //       context, const OnboardingPage()));
  // }
  //
  // /// Upload Image to Firebase Storage
  // Future<String?> uploadImage(File imageFile) async {
  //   final user = await bloc.getAuthenticatedUser();
  //   try {
  //     firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //         .ref()
  //         .child('profile_pictures/profile_${user.id}.jpg');
  //     await ref.putFile(imageFile);
  //     String imageUrl = await ref.getDownloadURL();
  //     return imageUrl;
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // /// Select image
  // Future<File?> chooseImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: source);
  //
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //     // Proceed with uploading the image to Firebase
  //     return imageFile;
  //   } else {
  //     // User cancelled the picker
  //     return null;
  //   }
  // }
  //
  // /// Update Profile
  // Future<void> updateProfile(
  //     BuildContext context, User user, ValueNotifier<bool> loading) async {
  //   await bloc.updateUserProfile(user);
  //   loading.value = false;
  //   await sl<UserLocalDatabase>().save(user).then((value) {
  //     loading.value = false;
  //     return NavigationHelper.pushAndRemoveUntilPage(
  //         context, const HomeBottomNavigator());
  //   });
  // }
  //
  // Future<void> deleteAccount(String documentID, BuildContext context) async {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             title: const Text('⚠ Warning',
  //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  //             content: const Text(
  //                 'Are you sure you want to delete your account? This action can not be undone.'),
  //             actions: [
  //               TextButton(
  //                   child: const Text('No'),
  //                   onPressed: () {
  //                     Navigator.pop(context); // Pop the dialog
  //                   }),
  //               TextButton(
  //                   child: const Text('Yes, delete account',
  //                       style: TextStyle(color: Color.fromRGBO(207, 9, 20, 1))),
  //                   onPressed: () async {
  //                     await bloc.deleteUserAccount(documentID).then(
  //                         (value) async => await bloc.logOUt().then((value) =>
  //                             NavigationHelper.pushAndRemoveUntilPage(
  //                                 context, const OnboardingPage())));
  //                   })
  //             ]);
  //       });
  // }
}
