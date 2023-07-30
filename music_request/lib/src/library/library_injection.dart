import 'package:get_it/get_it.dart';

import 'presentation/bloc/library_bloc.dart';

void initLibrary() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(
      () => LibraryBloc(authenticatedUser: sl(), listRequests: sl()));
}
