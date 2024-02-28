import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/widget/pages/panel/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../config/localize/languages.dart';
import '../../config/locator.dart';
import '../../util/constant/screen_size.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  // Future<InfoModel> loadFakeProfiles() async {
  //   final String response = await rootBundle.loadString('data/info.json');
  //   final data = await json.decode(response) ;
  //   var result =  InfoModel.fromJson(data["info"]);
  //   sl<UserModel>().infoModel = result;
  //   //data.remove("info");
  //   //data["hey"] = "hhhhh";
  //   //print(data.toString());
  //
  //   return result;
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<UserViewModel>(context,listen: false).GetUserModel();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
             // SizedBox(height:  sl<ScreenSize>().height*0.1,),

              Container(
                child: Image.asset('assets/app_icon.png',width: 100,height: 100,),
              ),
              SizedBox(height:  sl<ScreenSize>().height*0.05,),
              Text(AppLocale.app_name.getString(context),
              style:  Theme.of(context).textTheme.titleLarge?.copyWith(color: primary_title,fontSize: 20),),
              SizedBox(height:  sl<ScreenSize>().height*0.05,),
              Text(AppLocale.cv_builder.getString(context),
              style:  Theme.of(context).textTheme.titleLarge?.copyWith(color: primary_title,fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
