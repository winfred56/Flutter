import 'package:mini_shop/core/authenticate/domain/usecases/create.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../domain/usecases/log_in.dart';
import '../../domain/usecases/log_out.dart';

class AuthenticationBloc {
  /// Constructor
  AuthenticationBloc(
      {required this.create,
      required this.logOut,
      required this.logIn});

  /// Fields
  final Create create;
  final LogOut logOut;
  final LogIn logIn;

  Future<void> createState(String email, String password) async{
    final result = await create(CreateParams(email, password));
    return result.fold((f) => '', (user) => null);
  }


  Future<void> logInState(String email, String password) async {
    final result = await logIn(LogInParams(email, password));
    return result.fold((f) => '', (user) => null);
  }

  Future<void> logOutState() async{
    final result = await logOut(NoParams());
    return result.fold((f) => '', (user) => null);
  }
}
