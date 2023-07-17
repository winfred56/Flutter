import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:music_request/src/home/presentation/pages/home.dart';

import '../../../../injection_container.dart';
import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../../../../src/onboarding/presentation/pages/onboarding.dart';
import '../../data/database/user_local_database.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';

mixin UserLogic {
  /// Bloc
  final bloc = sl<UserBloc>();

  /// Firebase Instance
  final firebase = FirebaseAuth.instance;

  Future<void> signOut(BuildContext context) async {
    await firebase.signOut();
    await bloc.logOUt().then((value) => NavigationHelper.pushAndRemoveUntilPage(
        context, OnboardingPage()));
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
