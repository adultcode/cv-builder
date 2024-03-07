import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyVM extends ChangeNotifier{

  bool? isAcceptPrivacy = false;
  String? privacy_text;

  void ClearPrivacyText(){
    privacy_text = null;
  }
  void GetPrivacyText(int translate )async{

    if(privacy_text==null){
      if(translate==1){
        privacy_text = await rootBundle.loadString('assets/data/privacy_fa.txt');
        notifyListeners();
      }else{
        privacy_text = await rootBundle.loadString('assets/data/privacy_fa.txt');
        notifyListeners();

      }

    }
    //return privacy_text;

  }

  Future<bool?> isChecked()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(StringConst.privacy_key)==false){
      isAcceptPrivacy = false ;
    }else{
      isAcceptPrivacy =  await sharedPreferences.getBool(StringConst.privacy_key)??false;
    }
    return isAcceptPrivacy;
  }

  Future<bool>? ChangeParivacy(bool status) async{

    try{
      SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
      sharedPreferences.setBool(StringConst.privacy_key, status);
      return true;
    }catch(e){
      return false;
    }

  }
}