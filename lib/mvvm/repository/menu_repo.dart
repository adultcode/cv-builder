import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_widgets/panel/menu/big_menu_item.dart';
import '../model/entity/menu_model.dart';
import '../viewmodel/menu_viewmodel.dart';

class MenuRepo{

//  List<MenuModel> menu_list = [];
  List<Widget> menu_list_widget = [];

  List<Widget>  FetchMenu(MenuActionInterface actionHandler,{List<MenuModel>? menu_list,int? clicked}){



    menu_list_widget =   menu_list!.map((menu) {

        return InkWell(
          child: BigMenuItem(menu),
         // child: menu.active==true?ActiveMenuItem(menu):UnActiveMenuItem(menu),
          onTap: () {
            actionHandler.onMenuItemTap(menu.id);
          },
        );


    },).toList();

    return menu_list_widget;

  }

}









abstract class MenuActionInterface {
  void onMenuItemTap(int index);
}
