import 'dart:ui';

import 'package:cv_builder/model/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';

class ActiveMenuItem extends StatefulWidget {
  MenuModel menuModel;

  ActiveMenuItem(this.menuModel){
    print("Active: ${menuModel.id}----------");
  }

  @override
  State<ActiveMenuItem> createState() => _ActiveMenuItemState();
}

class _ActiveMenuItemState extends State<ActiveMenuItem> {
  final Duration animationDuration = const Duration(seconds: 6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MenuVM>(context).addListener(() {
      print("hee ${widget.menuModel.id}");
      });
    });

  }
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        print("---------CLicked--------");

        Provider.of<MenuVM>(context,listen: false).setActiveItem(widget.menuModel.id);
// setState(() {
//
// });
      },
      child: AnimatedContainer(
        duration: animationDuration,
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        padding: EdgeInsets.all(7),
        decoration: widget.menuModel.active==true
            ? BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
          color: panel_orange_accent,
        )
            : null,
        child: Icon(
          widget.menuModel.iconData,
          size: widget.menuModel.active ==true? 24 : 26,
          color: widget.menuModel.active ==true? panel_orange : panel_grey,
        ),
      ),
    );
  }
}