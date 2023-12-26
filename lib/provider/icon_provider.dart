import 'package:flutter/cupertino.dart';

class IconProvider extends ChangeNotifier{

  String? icon_path;

  void SetIcon(String? icon){
    icon_path = icon;
    notifyListeners();
  }
}