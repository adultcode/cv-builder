import 'dart:math';

import 'package:cv_builder/mvvm/viewmodel/menu_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../custom_widgets/panel/menu/side_menu.dart';
import '../education_page/education_big.dart';
import '../experience_page/experience_big.dart';
import '../profile_edit_page/profile_edit_big.dart';
import '../skill_page/skill_big.dart';
import '../social_page/social_page_big.dart';

class DashboardBig extends StatefulWidget {
  const DashboardBig({Key? key}) : super(key: key);

  @override
  State<DashboardBig> createState() => _DashboardBigState();
}

class _DashboardBigState extends State<DashboardBig>
    with SingleTickerProviderStateMixin {
  late ScreenSize screenSize;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenSize = sl<ScreenSize>();
    // _controller =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 1.0, // Start at the end for initial flip
      upperBound: 1.0,
    )..animateTo(0.0, curve: Curves.bounceInOut);
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
       _controller.reset();

      }
    });

    context.read<MenuVM>().addListener(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.03,
          vertical: screenSize.height * 0.03),
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

          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: screenSize.width * 0.03),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(1, 2, 0.0025)

                    ..rotateY(_controller.value * pi),
                  alignment: FractionalOffset.center,
                  child: Consumer<MenuVM>(
                    builder: (context, value, child) {
                      if (value.active_item == 0) {
                        return ProfileEditBig();
                      }
                      else if (value.active_item == 1) {
                        return SocialPageBig();
                      }
                      else if (value.active_item == 2) {
                        return ExperienceBig();
                      }
                      else if (value.active_item == 3) {
                        return EducationBig();
                      }
                      else if (value.active_item == 4) {
                        return SkillBig();
                      }
                      else {
                        return Text("test");
                      }
                    },
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
