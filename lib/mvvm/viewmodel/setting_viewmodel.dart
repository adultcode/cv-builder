import 'package:flutter/cupertino.dart';

class SettingVM extends ChangeNotifier{



// 0 -> not selected
// 1 -> Farsi
// 2 -> English
  int current_language = 0;


  SettingVM(){}

  void ChangeLanguage(int _select){

    current_language = _select;
    notifyListeners();
  }
}