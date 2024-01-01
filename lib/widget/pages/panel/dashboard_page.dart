import 'package:flutter/material.dart';

import '../../../config/locator.dart';
import '../../../util/constant/screen_size.dart';
import 'dashboard/dashboard_big.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

 late Widget _current_page;
 ScreenSizeStream? screenSizeStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // screenSizeStream = ScreenSizeStream();
    screenSizeStream = sl<ScreenSizeStream>();

    // if(ScreenSize.width<ScreenSize.smallwidth){
    //
    //   _current_page= Center(child: Text("Small ${ScreenSize.width}"),);
    // }else{
    //   _current_page= Center(child: Text("Bigggggg ${ScreenSize.width}"),);
    //   //_current_page= DashboardBig();
    //
    // }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      StreamBuilder(
        stream: screenSizeStream!.controller.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.width2<ScreenSize.smallwidth){

              return Center(child: Text("Small ${snapshot.data!.width2}"),);
            }else{
              return Center(child: Text("Bigggggg ${snapshot.data!.width2}"),);
              //_current_page= DashboardBig();

            }

          }else{
             return Center(child: InkWell(
               onTap: (){
                 ScreenSize  screenSize2 = ScreenSize();
              //   screenSize2.width2 =11;
                 screenSize2.height2 =12;

                 screenSizeStream!.controller.add(screenSize2);
               },
               child: Text("Empty"),
             ),);
          }

        },
      ),
    );
  }
}
