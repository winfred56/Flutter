import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


import '../../features/products/presentation/pages/products_home_page.dart';
import '../../features/products/presentation/widgets/product_detail.dart';

class Routes{
  /// Open [ProductsPage]
  static const products = '/products';
  /// Open [ProductsDetails]
  static const productsDetails = '/products_details';
  /// Open [UserInfo]
  static const userInfo = '/user_info';


  static final Map<String, WidgetBuilder> routes = {

    Routes.products: (BuildContext context) => const ProductsHomePage(),
    Routes.productsDetails: (BuildContext context) => const ProductDetail(),
    // Routes.userInfo: (BuildContext context) => const UserInformation(email: '',password:''),
  };

}