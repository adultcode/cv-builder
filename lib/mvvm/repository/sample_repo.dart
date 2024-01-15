import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/locator.dart';
import '../../util/constant/string_const.dart';
import '../model/entity/info_model/info_model.dart';

class DataRepository{
  //UserModel? _userModel;
 late SharedPreferences sharedPreferences;
String? result = "";


  Future<UserModel> LoadData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String response = await rootBundle.loadString('data/info.json');
    final data = await json.decode(response) ;

    // get info data
    sl<UserModel>().infoModel = InfoModel.fromJson(data["info"]);
      if(sharedPreferences.containsKey(StringConst.info_key)){
        debugPrint("Key exist");
         result =    await sharedPreferences?.getString(StringConst.info_key);
        debugPrint(result);
        sl<UserModel>().infoModel= InfoModel.fromJson(jsonDecode(result!));
      }else{
        debugPrint("Key NOT exist");
      }



    return  sl<UserModel>();
  }
}