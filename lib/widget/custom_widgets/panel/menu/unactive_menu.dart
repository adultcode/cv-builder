import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';

class UnActiveMenuItem extends StatelessWidget {

  MenuModel menuModel;

  UnActiveMenuItem(this.menuModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: sl<ScreenSize>().height*0.03),
      padding: EdgeInsets.all(7),

      child: Icon(menuModel.iconData,size: 26,color: panel_grey,),

    );
  }
}
