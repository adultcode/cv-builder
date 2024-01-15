import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/model/entity/info_model/info_model.dart';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../config/locator.dart';
import '../../main.dart';
import '../../test.dart';


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
    //loadFakeProfiles();
  //  UpdateFile();
    Provider.of<UserViewModel>(context,listen: false).GetUserModel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(child: Text("Loading...."),onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage( ),));
            },),
            SizedBox(height: 40,),

            Consumer<UserViewModel>(builder: (context, value, child) {

              if(value.userModel!=null){
                return Text("Info: ${value.userModel?.infoModel?.name}");

              }else{
                return Text("Info is null");
              }
            },)
          ],
        ),
      ),
    );
  }
}
