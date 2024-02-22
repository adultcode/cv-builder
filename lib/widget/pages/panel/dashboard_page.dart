import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../config/locator.dart';
import '../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../util/constant/android_version.dart';
import '../../../util/constant/screen_size.dart';
import '../../custom_widgets/panel/menu/drawer_menu.dart';
import 'dashboard/dashboard_big.dart';
import 'dashboard/dashboard_small.dart';
class Dashboard extends StatefulWidget {


  Dashboard();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      Provider.of<MenuVM>(context,listen: false).GetMenuList();

    });

  }
  @override
  Widget build(BuildContext context) {

    return
      StreamBuilder(
        stream: sl<ScreenSizeStream>().controller.stream,
        initialData: sl<ScreenSize>(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.width < ScreenSize.smallwidth
                ? DashboardSmall()
                : Scaffold(body: DashboardBig(),);
          } else
            return Text("EMpty");
        }
    );
  }
}

