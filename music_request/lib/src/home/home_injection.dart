import 'package:get_it/get_it.dart';

import 'presentation/bloc/home_bloc.dart';

initHome() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(
      () => HomeBloc(retrieveUser: sl(), authenticatedUser: sl()));
}
