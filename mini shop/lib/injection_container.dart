import 'package:get_it/get_it.dart';

import 'shared/network/network.dart';


/// Instantiate GetIT
final sl = GetIt.instance;

void init() {


  /// User Profile
  //initProfile();

  /// Shared - repositories
  sl

  /// Checks Internet Connectivity
      .registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);


}