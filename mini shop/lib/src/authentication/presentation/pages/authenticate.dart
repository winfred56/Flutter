import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop/features/products/presentation/pages/products_home_page.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/login_page.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// if user is logged in display the Home else Log in or Sign up page screen
    final user = Provider.of<User?>(context);
    if (user == null){
      return const LoginPage();
    }else{
      return const ProductsHomePage();
    }
  }
}
