import 'package:cv_builder/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../mvvm/repository/menu_repo.dart';
import '../mvvm/viewmodel/menu_viewmodel.dart';
import '../util/constant/screen_size.dart';

final GetIt sl = GetIt.instance;


void setUpSL(){
  //sl.registerLazySingleton<BuildContext>(() =>BuildContext());

  sl.registerLazySingleton<ScreenSizeStream>(() =>ScreenSizeStream());


  sl.registerLazySingleton<ScreenSize>(() =>ScreenSize());
  sl.registerLazySingleton<UserModel>(() =>UserModel());

  // sl.registerLazySingleton<FetchPersonRepository>(() =>FetchPersonRepositoryImpl());
  // sl.registerLazySingleton<FetchPersonUseCase>(() =>FetchPersonUseCase());
  // sl.registerLazySingleton<FetchPersonRemoteDS>(() =>FetchPersonRemoteDSImpl());

}