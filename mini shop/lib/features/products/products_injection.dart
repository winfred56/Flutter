import 'package:get_it/get_it.dart';
import 'package:mini_shop/features/products/data/data_sources/remote_data_source.dart';
import 'package:mini_shop/features/products/domain/use_cases/retrieve_all_products.dart';
import 'package:mini_shop/features/products/presentation/bloc/ProductBloc.dart';

import 'data/repositories/products_repository_impl.dart';
import 'domain/repositories/products_repository.dart';

void initProducts() {
  /// Init GetIt
  final sl = GetIt.instance;

  sl

    /// Remote Database
    ..registerLazySingleton<ProductsRemoteDatasource>(
        ProductsRemoteDatasourceImpl.new)

    /// Register Repositories
    ..registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
          remoteDatabase: sl(),
          networkInfo: sl(),
        ))
    ..registerFactory(() => ProductBloc(products: sl()))

    /// Register Usecases
    ..registerLazySingleton(() => RetrieveProducts(sl()));
}
