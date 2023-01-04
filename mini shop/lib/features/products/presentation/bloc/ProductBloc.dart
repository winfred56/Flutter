import 'package:mini_shop/features/products/domain/use_cases/retrieve_all_products.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/products.dart';

class ProductBloc {
  /// Constructor
  const ProductBloc({
    required this.products,
  });

  final RetrieveProducts products;

  /// Get an authenticated user account
  Future<List<Products>> getAllProducts() async {
    final result = await products(NoParams());
    return result.fold((failure) => [Products.initial()], (products) => products);
  }
}