import 'package:dartz/dartz.dart';
import 'package:mini_shop/features/products/domain/entities/products.dart';
import 'package:mini_shop/features/products/domain/repositories/products_repository.dart';
import 'package:mini_shop/shared/error/failure.dart';
import 'package:mini_shop/shared/usecase/usecase.dart';

class RetrieveProducts extends Usecase<List<Products>, NoParams>{
  /// Constructor
  RetrieveProducts(this.repository);


  ProductRepository repository;
  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) => repository.retrieveProducts();

}