import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_list.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class LanguageRepository{

  SharedPreferences? sharedPreferences;


  Future<bool?> ClearLanguageList()async{
    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.remove(StringConst.lang_key);
    return result;

  }

  /*
  save user information in shared prefences
   */
  Future<bool?> SaveLanguageDataList({required LanguageList languageList})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.lang_key, jsonEncode(languageList.toJson()));
    print("Save result: $result");
    return result;

  }
/*
  get saved data from shared prefences
   */
  Future<LanguageList> GetLanguageListData()async{


    sharedPreferences = await SharedPreferences.getInstance();
    print("Keys: ${sharedPreferences?.getKeys()}");
    var result =    await sharedPreferences?.getString(StringConst.lang_key);
    // print("work result: $result");
    //print(result);
    if(result!=null){
      return LanguageList.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }


}