import 'package:cv_builder/mvvm/model/entity/menu_model.dart';
import 'package:cv_builder/mvvm/viewmodel/menu_viewmodel.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import 'active_menu.dart';


class SideMenu extends StatelessWidget {

  SideMenu(){

  }

  @override
  Widget build(BuildContext context) {
   // final menuVM = Provider.of<MenuVM>(context,listen: false);
 //   Users users = Provider.of<Users>(context, listen: false);

   // final menuVM =context.read<MenuVM>();

    return Container(
      width: 80,
      height: sl<ScreenSize>().height,
      alignment: Alignment.center,

      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02),
      decoration: panel_container_decoration,
      child: Consumer<MenuVM>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.menu_list.length,
            itemBuilder: (context, index) {
              return ActiveMenuItem(value.menu_list[index]);
            },
          );
        },
      )

    );
  }
}
