import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';
import '../model/entity/info_model/info_model.dart';
import '../repository/sample_repo.dart';

class UserViewModel extends ChangeNotifier{
  UserModel? userModel;
 late DataRepository _dataRepository;
 // InfoModel? infoModel;

  UserViewModel(){
    _dataRepository = DataRepository();
    GetUserModel();
 }

  void GetUserModel()async{

    // read sample data from file
    // get fake data from json file
    debugPrint("Getusermodel called");
    userModel = await _dataRepository.LoadData();

   notifyListeners();



  }


}