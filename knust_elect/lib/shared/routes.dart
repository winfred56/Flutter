import 'package:flutter/cupertino.dart';

import '../src/authentication/presentation/pages/signin_page.dart';


/// Access all available routes in the application
/// Navigation routes to be used
class Routes {
  /// ++++++++++++++++++++++++++++
  /// All routes for main.dart
  /// ++++++++++++++++++++++++++++
  ///   /// Open [Login]
  static const String login = '/login';
  static final Map<String, WidgetBuilder> routes = {
    Routes.login: (BuildContext context) => const SignInPage()
  };
}
