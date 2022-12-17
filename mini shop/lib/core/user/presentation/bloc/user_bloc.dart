import 'package:mini_shop/core/user/domain/use_cases/sign_In.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/log_out.dart';
import '../../domain/use_cases/register.dart';


class UserBloc{
  /// Constructor
  UserBloc({

    required this.signInUser,
    required this.logOutUser,
    required this.registerUser
});

  final SignIn signInUser;
  final LogOut logOutUser;
  final Register registerUser;


  /// User Sign In
  Future<void> signIn(String email, String password) async {
    final result = await signInUser(SignInParams(email, password));
    return result.fold((failure) => failure.message, (success) => null);
  }

  /// Log out user
  Future<void> logOut() async {
    final result = await logOutUser(NoParams());
    return result.fold((failure) => failure.message, (success) => null);
  }

  /// Register user
  Future<void> register(String email, String password) async {
    final result = await registerUser(RegisterParams(email, password));
    return result.fold((failure) => failure.message, (success) => null);
  }
}