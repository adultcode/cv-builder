import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/setting_repo.dart';

class SettingVM extends ChangeNotifier{


late SettingRepository settingRepository;
// 0 -> not selected
// 1 -> Farsi
// 2 -> English
  int? current_language = 0;


  SettingVM(){
    settingRepository = SettingRepository();
  }

  void ChangeLanguage(int _select)async{

    current_language = _select;
      await settingRepository.SaveLanguageSetting(lang_id: _select);
    notifyListeners();
  }
  Future<int?> LoadSetting()async{

  //  current_language = _select;
   current_language =   await settingRepository.GetLanguageSetting();
   notifyListeners();

   return current_language;
  }
}