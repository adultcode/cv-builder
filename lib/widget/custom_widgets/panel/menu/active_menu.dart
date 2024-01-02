import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';

class ActiveMenuItem extends StatelessWidget {

  MenuModel menuModel;

  ActiveMenuItem(this.menuModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: sl<ScreenSize>().height*0.03),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(inner_radius)
        ),
            color: panel_orange_accent
      ),
      child: Icon(menuModel.iconData,size: 24,color: panel_orange,),
      
    );
  }
}
