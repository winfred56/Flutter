import 'package:get_it/get_it.dart';

import 'core/user/user_injection.dart';
import 'shared/network/network.dart';


/// Instantiate GetIT
final sl = GetIt.instance;

void init() {

  /// User
  initUser();

  /// Shared - repositories
  sl

  /// Checks Internet Connectivity
  .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


}