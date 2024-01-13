import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/constant/string_const.dart';

class InfoService{

  SharedPreferences? sharedPreferences;

  /*
  save user information in shared prefences
   */
  Future<bool> SaveInfoData({required InfoModel infoModel})async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =    await prefs.setString(StringConst.info_key, jsonEncode(infoModel.toJson()));
    return result;


  }
  /*
  get saved data from shared prefences
   */
  Future<InfoModel> GetInfoData()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =    await prefs.getString(StringConst.info_key);
    if(result!=null){
      InfoModel _info = InfoModel.fromJson(jsonDecode(result));
      return _info;

    }else{
   return   Future.error('There is no data with this key');
    }


  }
}