import 'package:cv_builder/mvvm/viewmodel/menu_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../custom_widgets/panel/menu/side_menu.dart';
import '../profile_edit/profile_edit_big.dart';


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
        child: Row(
          children: [
            // menu of page
            SideMenu(),

            /*
            show widget based on active item of menu
             */
            Expanded(child: Container(
              margin: EdgeInsets.only(left: screenSize.width*0.03),
              child: Consumer<MenuVM>(
                builder: (context, value, child) {
                  if(value.active_item==0){
                    return ProfileEditBig();
                  }else{
                    return Text("test");
                  }
                },
              ),
            )
            )
          ],
        ),

    );
  }
}
