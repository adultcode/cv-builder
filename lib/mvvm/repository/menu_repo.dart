import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/menu_model.dart';
import '../../widget/custom_widgets/panel/menu/active_menu.dart';
import '../../widget/custom_widgets/panel/menu/unactive_menu.dart';
import '../viewmodel/menu_viewmodel.dart';

class MenuRepo{

//  List<MenuModel> menu_list = [];
  List<Widget> menu_list_widget = [];

  List<Widget>  FetchMenu(MenuActionInterface actionHandler,{List<MenuModel>? menu_list,int? clicked}){
   // if(menu_list_widget)
   //  menu_list!.add(MenuModel(0,title: 'داشبورد',active: clicked==0?true:false,iconData:Icons.person ));
   //  menu_list!.add(MenuModel(1,title: 'اطلاعات',active: clicked==1?true:false,iconData:Icons.event_note_outlined ));
   //  menu_list!.add(MenuModel(2,title: 'سوابق کاری',active: clicked==2?true:false,iconData:Icons.work ));
   //  menu_list!.add(MenuModel(3,title: 'سوابق تحصیلی',active: clicked==3?true:false,iconData:Icons.school ));
   //  menu_list!.add(MenuModel(4,title: 'مهارت ها',active: clicked==4?true:false,iconData:Icons.settings ));
   //  menu_list!.add(MenuModel(5,title: 'زبان',active: clicked==5?true:false,iconData:Icons.language ));
   //  menu_list!.add(MenuModel(6,title: 'شبکه های اجتماعی',active: clicked==6?true:false,iconData:Icons.alternate_email ));


    menu_list_widget =   menu_list!.map((menu) {

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
