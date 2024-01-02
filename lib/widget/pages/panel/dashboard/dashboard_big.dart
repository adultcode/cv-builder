import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../custom_widgets/panel/menu/side_menu.dart';


class DashboardBig extends StatefulWidget {
  const DashboardBig({Key? key}) : super(key: key);

  @override
  State<DashboardBig> createState() => _DashboardBigState();
}

class _DashboardBigState extends State<DashboardBig> {
  late ScreenSize screenSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenSize = sl<ScreenSize>();

  }
  @override
  Widget build(BuildContext context) {
    return
       Container(
         padding: EdgeInsets.symmetric(horizontal:screenSize.width*0.03, vertical: screenSize.height*0.03),
         width: screenSize.width,
         height: screenSize.height,
        color: backgroud_color,
        alignment: Alignment.centerLeft,
        child: SideMenu(),

    );
  }
}
