import 'package:flutter/cupertino.dart';

class MenuModel{

  int id;
  String? title;
  bool? active;
  IconData? iconData;


  MenuModel(this.id,{this.title, this.active, this.iconData});
}