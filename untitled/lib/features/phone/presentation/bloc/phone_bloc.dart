import 'package:untitled/core/user/domain/use_cases/phone_Sign_In.dart';

import '../../../../core/user/domain/entities/user.dart';

class SignInBloc {
  SignInBloc({required this.createUser});

  final PhoneSignIn createUser;

  Future<String?> phoneSignIn(User user) async {
    final result = await createUser(PhoneSignInParams(user));
    return result.fold(
          (failure) => failure.toString(),
          (success) => success.id,
    );
  }
}
