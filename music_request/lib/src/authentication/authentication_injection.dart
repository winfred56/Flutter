import 'package:get_it/get_it.dart';

import 'presentation/bloc/authentication_bloc.dart';

initAuthentication() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(() => AuthenticationBloc(
      createUser: sl(),
      retrieveUser: sl(),
      logoutUser: sl(),
      updateUser: sl(),
      authenticatedUser: sl(),
      pushNotification: sl()));
}
