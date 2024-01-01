import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/menu_model.dart';
import '../../widget/custom_widgets/panel/menu/active_menu.dart';
import '../../widget/custom_widgets/panel/menu/unactive_menu.dart';

class MenuRepo{

  List<MenuModel> menu_list = [];
  List<Widget> menu_list_widget = [];

  List<Widget>  FetchMenu(){
    menu_list.add(MenuModel(title: 'داشبورد',active: true,iconData:Icons.person ));
    menu_list.add(MenuModel(title: 'اطلاعات',active: false,iconData:Icons.event_note_outlined ));
    menu_list.add(MenuModel(title: 'سوابق کاری',active: false,iconData:Icons.work ));
    menu_list.add(MenuModel(title: 'سوابق تحصیلی',active: false,iconData:Icons.school ));
    menu_list.add(MenuModel(title: 'مهارت ها',active: false,iconData:Icons.settings ));
    menu_list.add(MenuModel(title: 'زبان',active: false,iconData:Icons.language ));
    menu_list.add(MenuModel(title: 'شبکه های اجتماعی',active: false,iconData:Icons.alternate_email ));


    menu_list_widget =   menu_list.map((menu) {
      if(menu.active==true){
        return InkWell(
          child: ActiveMenuItem(menu),
          onTap: () {

          },
        );
      }else return InkWell(
        // highlightColor: Colors.redAccent,
        // focusColor: Colors.green,
        // splashColor: Colors.lightBlue,
        child: UnActiveMenuItem(menu),
        onTap: () {

        },
      );
    },).toList();

    return menu_list_widget;

  }

}