import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_request/src/home/presentation/pages/home.dart';

import '../../../../core/user/data/database/user_local_database.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/presentation/pages/update_profile.dart';
import '../../../../injection_container.dart';
import '../../../../shared/presentation/ui/navigation_helper.dart';
import '../bloc/authentication_bloc.dart';

mixin AuthLogic {
  /// BloC holder
  final bloc = sl<AuthenticationBloc>();

  /// Firebase Instance
  final firebase = FirebaseAuth.instance;

  /// Continue With Google
  Future<void> continueWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ['email'], signInOption: SignInOption.standard);
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    /// Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    /// Sign in the user with the credentials
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(error.code,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Theme.of(context).colorScheme.onError))));
    });
    final user = User.initial().copyWith(
        id: firebase.currentUser!.uid,
        phoneNumber: firebase.currentUser?.phoneNumber ?? '',
        photo: firebase.currentUser?.photoURL ?? User.initial().photo,
        email: firebase.currentUser!.email ?? '',
        fullName: firebase.currentUser?.displayName ?? '');
    await bloc.createUserProfile(user);
    await sl<UserLocalDatabase>().save(user).then((value) {
      return NavigationHelper.pushAndRemoveUntilPage(context, const HomePage());
    });
  }

  /// Sign In
  Future<void> signIn(String email, String password, BuildContext context,
      ValueNotifier<bool> loading) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.trim(), password: password)
        .catchError((error) {
      loading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(error.code,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Theme.of(context).colorScheme.onError))));
    });
    if (firebase.currentUser?.uid == null) {
      return;
    }
    final user = await bloc.retrieve(firebase.currentUser!.uid);
    await sl<UserLocalDatabase>().save(user).then((value) {
      loading.value = false;
      return NavigationHelper.pushAndRemoveUntilPage(context, const HomePage());
    });
  }

  /// Register
  Future<void> register(String email, String password, BuildContext context,
      ValueNotifier<bool> loading) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .catchError((error) {
      loading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text(error.code,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Theme.of(context).colorScheme.onError))));
    });
    final userID = firebase.currentUser!.uid;
    final user = User.initial().copyWith(id: userID, email: email);
    await bloc.createUserProfile(user);
    await sl<UserLocalDatabase>().save(user).then((value) {
      loading.value = false;
      return NavigationHelper.pushAndRemoveUntilPage(
          context, const UpdateProfilePage());
    });
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
