import 'package:dartz/dartz.dart';
import 'package:mini_shop/features/products/domain/entities/products.dart';

import '../../../../shared/error/failure.dart';

abstract class ProductRepository{
  /// Get all products from Firestore
  Future<Either<Failure, List<Products>>> retrieveProducts();
}