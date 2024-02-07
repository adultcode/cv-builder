import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../home_page/home_small.dart';
import '../profile_edit_page/profile_edit_big.dart';

class DashboardSmall extends StatefulWidget {
  const DashboardSmall({Key? key}) : super(key: key);

  @override
  State<DashboardSmall> createState() => _DashboardSmallState();
}

class _DashboardSmallState extends State<DashboardSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MenuVM>(
        builder: (context, value, child) {
          if (value.active_item == 0) {
             return HomePageSmall();
            //return Text("Small profile edit");
          }
          else return Text("sfsdjh");
        },
      ),
    );
  }
}



class DashboarHelper extends StatelessWidget {

  AppBar? appBar;
  Widget? drawer;
  Widget? body;

  Widget? fab;

  DashboarHelper({this.appBar, this.drawer, this.body,this.fab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: fab,
      appBar: appBar,
      endDrawer: drawer,
      body: body,
    );
  }
}
