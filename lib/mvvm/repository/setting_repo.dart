import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/string_const.dart';

class SettingRepository{


  // lang_id 1 -> Farsi
  // lang_id 2 -> English
  Future<bool> SaveLanguageSetting({required int lang_id})async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =    await prefs.setInt(StringConst.Langsetting_key, lang_id);
    return result;


  }
  Future<bool> CheckLanguageSetting()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =    await prefs.containsKey(StringConst.Langsetting_key);
    return result;


  }
  Future<int?> GetLanguageSetting()async{


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result =    await prefs.getInt(StringConst.Langsetting_key);
    return result;


  }

}