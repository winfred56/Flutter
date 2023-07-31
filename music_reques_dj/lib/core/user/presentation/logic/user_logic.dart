import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../injection_container.dart';
import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../src/home/presentation/pages/home.dart';
import '../../../../src/onboarding/presentation/pages/onboarding.dart';
import '../../data/database/user_local_database.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';

mixin UserLogic {
  /// Bloc
  final bloc = sl<UserBloc>();

  /// Firebase Instance
  final firebase = FirebaseAuth.instance;

  // Holds the selected image file
  final selectedImage = ValueNotifier<File?>(null);

  Future<void> signOut(BuildContext context) async {
    await firebase.signOut();
    await bloc.logOUt().then((value) =>
        NavigationHelper.pushAndRemoveUntilPage(context, OnboardingPage()));
  }

  /// Upload Image to Firebase Storage
  Future<String?> uploadImage(File imageFile) async {
    final user = await bloc.getAuthenticatedUser();
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_pictures/profile_${user.id}.jpg');
      await ref.putFile(imageFile);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      return null;
    }
  }

  /// Select image
  Future<File?> chooseImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Proceed with uploading the image to Firebase
      return imageFile;
    } else {
      // User cancelled the picker
      return null;
    }
  }

  /// Update Profile
  Future<void> updateProfile(
      BuildContext context, User user, ValueNotifier<bool> loading) async {
    await bloc.updateUserProfile(user);
    loading.value = false;
    await sl<UserLocalDatabase>().save(user).then((value) {
      loading.value = false;
      return NavigationHelper.pushAndRemoveUntilPage(context, const HomePage());
    });
  }
}
