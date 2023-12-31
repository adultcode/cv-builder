import 'package:flutter/material.dart';

import '../../../util/constant/screen_size.dart';
import 'dashboard/dashboard_big.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        ScreenSize.width =constraints.maxWidth;
        ScreenSize.height =constraints.maxHeight;
        if(constraints.maxWidth<ScreenSize.smallwidth){

          return Center(child: Text("Small ${constraints.maxWidth}"),);
        }else{
          return DashboardBig();

        }
      },),
    );
  }
}
