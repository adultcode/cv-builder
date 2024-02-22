import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../education_page/education_small.dart';
import '../experience_page/experience_big.dart';
import '../experience_page/experience_small.dart';
import '../home_page/home_small.dart';
import '../language_page/language_small.dart';
import '../profile_edit_page/profile_edit_big.dart';
import '../profile_edit_page/profile_edit_small.dart';
import '../skill_page/skill_small.dart';
import '../social_page/social_page_small.dart';

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
          else if (value.active_item == 1) {
             return ProfileEditSmall();
          }
          else if (value.active_item == 2) {
             return   ExperienceSmall();();
          }
          else if (value.active_item == 3) {
             return   EducationSmall();();
          }
          else if (value.active_item == 4) {
             return   SkillSmall();();
          }
          else if (value.active_item == 5) {
             return   LanguageSmall();();
          }
          else return SocialPageSmall();
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
      backgroundColor: Color(0xfffbfdff),
    floatingActionButton: fab,
      appBar: appBar,
      endDrawer: drawer,
      body: body,
    );
  }
}
