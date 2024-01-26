import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class SkillRepository{

  SharedPreferences? sharedPreferences;


  Future<bool?> ClearSkillList()async{
    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.remove(StringConst.skill_key);
    return result;

  }

  /*
  save user information in shared prefences
   */
  Future<bool?> SaveSkillDataList({required SkillList skillList})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.skill_key, jsonEncode(skillList.toJson()));
    print("Save result: $result");
    return result;

  }
/*
  get saved data from shared prefences
   */
  Future<SkillList> GetSkillListData()async{


    sharedPreferences = await SharedPreferences.getInstance();
    print("Keys: ${sharedPreferences?.getKeys()}");
    var result =    await sharedPreferences?.getString(StringConst.skill_key);
    // print("work result: $result");
    //print(result);
    if(result!=null){
      return SkillList.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }


}