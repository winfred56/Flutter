import 'package:flutter/cupertino.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/login_page.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/signup_page.dart';

class Routes{
  /// Open [SignUpPage]
  static const signUp = '/signup';
  /// Open [LoginPage]
  static const login = '/login';


  static final Map<String, WidgetBuilder> routes = {
    Routes.signUp : (BuildContext context) => const SignUpPage(),
    Routes.login: (BuildContext context) => const LoginPage(),
  };

}