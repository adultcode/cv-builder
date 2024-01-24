import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class EducationRepository{

  SharedPreferences? sharedPreferences;


  Future<bool?> ClearEducationist()async{
    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.remove(StringConst.education_key);
    return result;

  }

  /*
  save user information in shared prefences
   */
  Future<bool?> SaveWorkDataList({required EducationList educationList})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.education_key, jsonEncode(educationList.toJson()));
    print("Save result: $result");
    return result;

  }
/*
  get saved data from shared prefences
   */
  Future<EducationList> GetEducationListData()async{


    sharedPreferences = await SharedPreferences.getInstance();
    print("Keys: ${sharedPreferences?.getKeys()}");
    var result =    await sharedPreferences?.getString(StringConst.education_key);
    // print("work result: $result");
    //print(result);
    if(result!=null){
      return EducationList.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }


}