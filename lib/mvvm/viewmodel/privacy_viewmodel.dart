import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyVM extends ChangeNotifier{

  bool? isAcceptPrivacy = false;

  void isChecked()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(StringConst.privacy_key)==false){
      isAcceptPrivacy = false ;
    }else{
      isAcceptPrivacy =  await sharedPreferences.getBool(StringConst.privacy_key)??false;
    }
    notifyListeners();
  }

  void ChangeParivacy(bool status) async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setBool(StringConst.privacy_key, status);
    notifyListeners();

  }
}