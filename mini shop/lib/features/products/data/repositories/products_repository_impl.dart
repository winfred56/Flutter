import 'package:dartz/dartz.dart';
import 'package:mini_shop/features/products/data/data_sources/remote_data_source.dart';
import 'package:mini_shop/features/products/domain/entities/products.dart';
import 'package:mini_shop/features/products/domain/repositories/products_repository.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/network/network.dart';


class ProductRepositoryImpl implements ProductRepository {
  /// Constructor
  ProductRepositoryImpl(
      {required this.networkInfo,
        required this.remoteDatabase,
        });

  /// Dependencies
  NetworkInfo networkInfo;
  ProductsRemoteDatasource remoteDatabase;

  @override
  Future<Either<Failure, List<Products>>> retrieveProducts() async{
   try{
     await networkInfo.hasInternet();
     final results = await remoteDatabase.retrieveProducts();
     return Right(results);
   } catch (error){
     print(error.toString());
     print('=========== retrieveProducts Method ===========');
     return const Left(Failure('Error From RetrieveProducts'));
   }
  }


}