import 'package:get_it/get_it.dart';

import 'core/authenticate/authentication_injection.dart';
import 'shared/network/network.dart';


/// Instantiate GetIT
final sl = GetIt.instance;

void init() {
  /// Authentication Service
  initAuthentication();

  /// Shared - repositories
  sl

  /// Checks Internet Connectivity
      .registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);


}