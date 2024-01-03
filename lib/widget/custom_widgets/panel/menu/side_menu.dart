import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/mvvm/viewmodel/menu_viewmodel.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/unactive_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/radius_size.dart';
import 'active_menu.dart';


class SideMenu extends StatelessWidget {

 // List<MenuModel> menu_list = [];
  //List<Widget> menu_list_widget = [];
  SideMenu(){
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 80,
      height: sl<ScreenSize>().height,
      alignment: Alignment.center,

      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02),
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
      child: Consumer<MenuVM>(

        builder:(context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                ...value.menu_list_widget
            //Text("s")
          ],
        );
      },)



      ),
    );
  }
}
