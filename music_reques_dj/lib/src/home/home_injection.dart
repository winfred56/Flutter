import 'package:get_it/get_it.dart';

import 'presentation/bloc/home_bloc.dart';

/// [HomeBloc] Dependencies
void initHome() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(() => HomeBloc(
      authenticatedUser: sl()));
}