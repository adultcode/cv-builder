import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/social_model/social_list.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/repository/skill_repo.dart';
import 'package:cv_builder/mvvm/repository/social_repo.dart';
import 'package:cv_builder/mvvm/repository/work_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/locator.dart';
import '../../util/constant/string_const.dart';
import '../model/entity/info_model/info_model.dart';
import 'education_repo.dart';
import 'info_repo.dart';
import 'language_repo.dart';

class DataRepository{
  //UserModel? _userModel;
 late SharedPreferences sharedPreferences;
String? result = "";

List<SocialModel> soc_list = [];
late UserModel userModel;

late InfoRepository infoRepository;
late EducationRepository educationRepository;
late LanguageRepository languageRepository;
late SkillRepository skillRepository;
late SocialRepository socialRepository;
late WorkRepository workRepository;
 DataRepository(){
   infoRepository = InfoRepository();
   educationRepository = EducationRepository();
   languageRepository = LanguageRepository();
   skillRepository = SkillRepository();
   socialRepository = SocialRepository();
   workRepository = WorkRepository();
   userModel = UserModel();
 }

 Future<UserModel?> LoadData() async{
   // get user info
   try{
     var _info = await infoRepository.GetInfoData();
     if(_info !=null){
       userModel.infoModel = _info;
     }
   }catch (e){
     userModel.infoModel = null;
   }


   // get education info

   try{
     var _info_ed = await educationRepository.GetEducationListData();
     if(_info_ed !=null){
       userModel.educations = _info_ed;
     }
   }catch (e){
     userModel.educations = null;
   }

   // get language info

   try{
     var _info_lang = await languageRepository.GetLanguageListData();
     if(_info_lang !=null){
       userModel.languageList = _info_lang;
     }
   }catch (e){
     userModel.languageList = null;
   }

   // get skill info

   try{
     var _info_skill = await skillRepository.GetSkillListData();
     if(_info_skill !=null){
       userModel.skills = _info_skill;
     }
   }catch (e){
     userModel.skills = null;
   }

   // get social info

   try{
     var _info_social = await socialRepository.GetSocialListData();
     if(_info_social !=null){
       userModel.socials = _info_social;
     }
   }catch (e){
     userModel.socials = null;
   }

   // get work info

   try{
     var _info_work = await workRepository.GetWorkListData();
     if(_info_work !=null){
       userModel.works = _info_work;
     }
   }catch (e){
     userModel.works = null;
   }


   return userModel;
 }
//   Future<UserModel?> LoadData() async {
//     soc_list.clear();
//     sharedPreferences = await SharedPreferences.getInstance();
//     final String response = await rootBundle.loadString('data/info.json');
//     final data = await json.decode(response) ;
//
//     // get info data
//     sl<UserModel>().infoModel = InfoModel.fromJson(data["info"]);
//       if(sharedPreferences.containsKey(StringConst.info_key)){
//         debugPrint("Key exist");
//          result =    await sharedPreferences?.getString(StringConst.info_key);
//       //  debugPrint(result);
//         sl<UserModel>().infoModel= InfoModel.fromJson(jsonDecode(result!));
//       }else{
//         debugPrint("Key NOT exist");
//       }
//
//
//       // get social information
//    // print(data["socialModels"]);
//     if(sharedPreferences.containsKey('StringConst.social_key')){
//       debugPrint("Social exist");
//     var  result2 =    await sharedPreferences?.getString(StringConst.social_key);
//       Iterable social_it = json.decode(result2!)["socialModels"];
//
//   social_it.forEach((element) {
//     if(element!=null){
//       soc_list.add(SocialModel.fromJson(element));
//     }
//   });
//      sl<UserModel>().socials = soc_list;
//       print(social_it.last);
//
//
//     }
//     return  sl<UserModel>();
//
// }
}