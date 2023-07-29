import 'package:get_it/get_it.dart';
import 'package:music_reques_dj/src/library/presentation/bloc/library_bloc.dart';

void initLibrary() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(() => LibraryBloc(
      authenticatedUser: sl(), listRequests: sl(), updateRequest: sl()));
}
