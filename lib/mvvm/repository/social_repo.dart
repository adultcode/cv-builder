import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class SocialRepository{

  SharedPreferences? sharedPreferences;


  Future<bool?> SaveSocialDataList({required SocialList socialModel})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.social_key, jsonEncode(socialModel.toJson()));
    return result;

  }

  Future<SocialList> GetSocialListData()async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.getString(StringConst.social_key);
    print(result);
    if(result!=null){
      return SocialList.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }

  /*
  save user information in shared prefences
   */
  Future<bool?> SaveSocialData({required SocialModel socialModel})async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.setString(StringConst.social_key, jsonEncode(socialModel.toJson()));
    return result;

  }
  /*
  get saved data from shared prefences
   */
  Future<SocialModel> GetSocialData()async{

    sharedPreferences = await SharedPreferences.getInstance();
    var result =    await sharedPreferences?.getString(StringConst.social_key);
    if(result!=null){
      return SocialModel.fromJson(jsonDecode(result));


    }else{
      return   Future.error('There is no data with this key');
    }

  }
}