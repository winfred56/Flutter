import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_shop/features/products/domain/entities/products.dart';

abstract class ProductsRemoteDatasource{
  /// Get all the products from firestore
  Future<List<Products>> retrieveProducts();
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource{
  @override
  Future<List<Products>> retrieveProducts() async {
    final items = await FirebaseFirestore.instance.collection('products').get();
    final result = items.docs.map((doc) => Products.fromJson(doc.data())).toList();
    return result;
  }

}