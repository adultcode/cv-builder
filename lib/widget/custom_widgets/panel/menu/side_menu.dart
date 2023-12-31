import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/unactive_menu.dart';
import 'package:flutter/material.dart';

import '../../../../util/constant/radius_size.dart';
import 'active_menu.dart';


class SideMenu extends StatelessWidget {

  List<MenuModel> menu_list = [];
  List<Widget> menu_list_widget = [];
  SideMenu(){

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
        highlightColor: Colors.redAccent,
        focusColor: Colors.green,
        splashColor: Colors.lightBlue,
        child: UnActiveMenuItem(menu),
        onTap: () {

        },
      );
    },).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: ScreenSize.height,
      alignment: Alignment.center,

      padding: EdgeInsets.symmetric(vertical: ScreenSize.height*0.02),
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.all(Radius.circular(outer_radius)),
          border: Border.all(
          color: Color(0xffeff0f3),
                //width: 3
              ),
        boxShadow: [
          BoxShadow(
          color:  Colors.black12.withOpacity(0.1),
            offset: Offset(2,2),
            spreadRadius: 1,
            blurRadius: 10
          )
        ]
      ),
      child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...menu_list_widget
        ],
      ),
      ),
    );
  }
}
