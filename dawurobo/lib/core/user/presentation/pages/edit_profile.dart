import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../../injection_container.dart';
import '../../../../shared/ui/loader.dart';
import '../../data/data_sources/local_database.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  /// Bloc Holder
  final bloc = sl<UserBloc>();

  /// Form Controller
  final formKey = GlobalKey<FormState>();

  /// Notifier
  final userDetails = ValueNotifier(User.initial());

  /// Logout
  void logout()async{
    await firebase_auth.FirebaseAuth.instance.signOut();
    final result =  sl<UserLocalDatabase>().retrieve() as User;
    await sl<UserLocalDatabase>().delete(result);
  }

  /// Controllers
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userDetails.value = await bloc.getAuthenticatedUser();
      emailController.text = userDetails.value.email;
      usernameController.text = userDetails.value.username;
      nameController.text = userDetails.value.fullName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: userDetails, builder: (context, value, _){
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,)),
            automaticallyImplyLeading: false,
            title: Text('Edit Profile ✏',
                style: Theme.of(context).textTheme.bodyMedium!
                    .apply(fontSizeDelta: 3, fontWeightDelta: 4)),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () => logout(), icon: const Icon(Icons.exit_to_app_rounded, color: Colors.brown))
            ]
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 10),
          child:SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration:
                        const InputDecoration(hintText: 'Username'),
                        controller: usernameController),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
                    TextFormField(
                        decoration:
                        const InputDecoration(hintText: 'Full name'),
                        controller: nameController),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
                    TextFormField(
                        decoration:
                        const InputDecoration(hintText: 'Email'),
                        controller: emailController),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20.0),),
                    OutlinedButton(onPressed: () async{
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      final updatedDetails = userDetails.value
                          .copyWith(
                          username:
                          usernameController.value.text,
                          email: emailController.value.text
                              .trim(),
                          fullName: nameController.value.text);
                      await showDialog<void>(
                          context: context,
                          builder: (context) => LoadingPage(
                              errorText: bloc.updateUserDetails(
                                  updatedDetails),
                              onLoadingDone: () async {
                                await sl<UserLocalDatabase>()
                                    .save(updatedDetails);
                                userDetails.value =
                                    updatedDetails;
                              },
                              loadingText:
                              'Updating Account ...🎉'));
                    }, child: const Text('Save'))
                  ],
                ),
              ),
            )
          )
        )
      );
    }
    );
  }
}
