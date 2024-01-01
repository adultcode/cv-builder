import 'package:get_it/get_it.dart';

import '../util/constant/screen_size.dart';

final GetIt sl = GetIt.instance;


void setUpSL(){
  sl.registerLazySingleton<ScreenSizeStream>(() =>ScreenSizeStream());

  // sl.registerLazySingleton<FetchPersonRepository>(() =>FetchPersonRepositoryImpl());
  // sl.registerLazySingleton<FetchPersonUseCase>(() =>FetchPersonUseCase());
  // sl.registerLazySingleton<FetchPersonRemoteDS>(() =>FetchPersonRemoteDSImpl());

}