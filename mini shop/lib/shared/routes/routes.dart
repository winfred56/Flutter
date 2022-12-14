import 'package:flutter/cupertino.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/login_page.dart';
import 'package:mini_shop/src/authentication/presentation/widgets/signup_page.dart';

import '../../features/products/presentation/pages/products_home_page.dart';
import '../../features/products/presentation/widgets/product_detail.dart';

class Routes{
  /// Open [SignUpPage]
  static const signUp = '/signup';
  /// Open [LoginPage]
  static const login = '/login';
  /// Open [ProductsPage]
  static const products = '/products';
  /// Open [ProductsDetails]
  static const productsDetails = '/products_details';


  static final Map<String, WidgetBuilder> routes = {
    Routes.signUp : (BuildContext context) => const SignUpPage(),
    Routes.login: (BuildContext context) => const LoginPage(),
    Routes.products: (BuildContext context) => const ProductsHomePage(),
    Routes.productsDetails: (BuildContext context) => const ProductDetail(),
  };

}