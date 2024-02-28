import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import 'big_menu_item.dart';
import 'mobile_menu_item.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Color(0xfffffff4),
      child: Consumer<MenuVM>(
        builder: (context, value, child) {
          return Column(
            children: [
            Container(
              height: sl<ScreenSize>().height*0.2,
              decoration: BoxDecoration(
                color: primary_surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 1
                  )
                ]
              ),
              child: Center(
                child: Text( AppLocale.app_name.getString(context),
                style:  Theme.of(context).textTheme.titleLarge,),
              ),
            ),
             Expanded(child:  ListView.builder(
               itemCount: value.menu_list.length,
               itemBuilder: (context, index) {
                 return MobileMenuItem(value.menu_list[index]);
               },
             ))
            ],
          );
        },
      ),
    );
  }
}
