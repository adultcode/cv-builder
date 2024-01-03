import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/menu_model.dart';
import '../../widget/custom_widgets/panel/menu/active_menu.dart';
import '../../widget/custom_widgets/panel/menu/unactive_menu.dart';
import '../viewmodel/menu_viewmodel.dart';

class MenuRepo{

  List<MenuModel> menu_list = [];
  List<Widget> menu_list_widget = [];

  List<Widget>  FetchMenu(MenuActionInterface actionHandler){
    menu_list.add(MenuModel(0,title: 'داشبورد',active: true,iconData:Icons.person ));
    menu_list.add(MenuModel(1,title: 'اطلاعات',active: false,iconData:Icons.event_note_outlined ));
    menu_list.add(MenuModel(2,title: 'سوابق کاری',active: false,iconData:Icons.work ));
    menu_list.add(MenuModel(3,title: 'سوابق تحصیلی',active: false,iconData:Icons.school ));
    menu_list.add(MenuModel(4,title: 'مهارت ها',active: false,iconData:Icons.settings ));
    menu_list.add(MenuModel(5,title: 'زبان',active: false,iconData:Icons.language ));
    menu_list.add(MenuModel(6,title: 'شبکه های اجتماعی',active: false,iconData:Icons.alternate_email ));


    menu_list_widget =   menu_list.map((menu) {

        return InkWell(
          child: menu.active==true?ActiveMenuItem(menu):UnActiveMenuItem(menu),
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
