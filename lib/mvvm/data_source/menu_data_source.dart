import 'package:flutter/material.dart';

import '../model/entity/menu_model.dart';

class MenuDataSource{



  List<MenuModel> menu_list=[];
  MenuDataSource(){
    menu_list.add(MenuModel(0,title: 'داشبورد',active: true,iconData:Icons.person ));
    menu_list.add(MenuModel(1,title: 'اطلاعات',active: false,iconData:Icons.event_note_outlined ));
    menu_list.add(MenuModel(2,title: 'سوابق کاری',active: false,iconData:Icons.work ));
    menu_list.add(MenuModel(3,title: 'سوابق تحصیلی',active: false,iconData:Icons.school ));
    menu_list.add(MenuModel(4,title: 'مهارت ها',active:false,iconData:Icons.settings ));
    menu_list.add(MenuModel(5,title: 'زبان',active: false,iconData:Icons.language ));
    menu_list.add(MenuModel(6,title: 'شبکه های اجتماعی',active:false,iconData:Icons.alternate_email ));

  }

  List<MenuModel>  ChangeActiveMenu({required int current,required int clicked}){
    menu_list[current].active = false;
    menu_list[clicked].active = true;
    return menu_list;

  }

}