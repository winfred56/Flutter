import 'package:get_it/get_it.dart';

import 'presentation/bloc/authentication_bloc.dart';

initAuthentication(){
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(
          () => AuthenticationBloc(createProfile: sl(), createDevice: sl(), retrieveStudent: sl()));
}