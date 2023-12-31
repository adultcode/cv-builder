import 'package:flutter/material.dart';

import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../custom_widgets/panel/side_menu.dart';


class DashboardBig extends StatefulWidget {
  const DashboardBig({Key? key}) : super(key: key);

  @override
  State<DashboardBig> createState() => _DashboardBigState();
}

class _DashboardBigState extends State<DashboardBig> {
  @override
  Widget build(BuildContext context) {
    return
       Container(
         padding: EdgeInsets.symmetric(horizontal:ScreenSize.width*0.03, vertical: ScreenSize.height*0.03),
         width: ScreenSize.width,
         height: ScreenSize.height,
        color: backgroud_color,
        alignment: Alignment.centerLeft,
        child: SideMenu(),

    );
  }
}
