import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class WorkRepository{

  SharedPreferences? sharedPreferences;

/*
  save user information in shared prefences
   */
  Future<bool?> SaveWorkDataList({required WorklList worklList})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.work_key, jsonEncode(worklList.toJson()));
    return result;

  }
/*
  get saved data from shared prefences
   */
  Future<WorklList> GetWorkListData()async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.getString(StringConst.work_key);
    print("work result: $result");
    print(result);
    if(result!=null){
      return WorklList.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }



}