import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/locator.dart';
import '../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../util/constant/screen_size.dart';
import 'dashboard/dashboard_big.dart';
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

    return Scaffold(
      body:
      StreamBuilder(
        stream: sl<ScreenSizeStream>().controller.stream,
        initialData: sl<ScreenSize>(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.width<ScreenSize.smallwidth){
              return Center(child: Text("Small ${snapshot.data!.width}"),);
            }else{
              return DashboardBig();
            }

          }else{
             return Center(child: InkWell(
               onTap: (){
               },
               child: Text("Empty"),
             ),);
          }

        },
      ),
    );
  }
}
