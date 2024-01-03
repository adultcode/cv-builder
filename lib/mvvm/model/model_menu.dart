import 'package:cv_builder/model/menu_model.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_widgets/panel/menu/unactive_menu.dart';

class ModelMenu{

  static MenuItemClick({int? current_id,List<MenuModel>? menu_items,List<Widget>? menu_list_widget}){
    menu_items![current_id!].active = false; // make active item to not active
    menu_list_widget![current_id] =UnActiveMenuItem(menu_items[current_id]);


  }
}