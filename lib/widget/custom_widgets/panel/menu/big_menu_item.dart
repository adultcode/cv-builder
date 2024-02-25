import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';

class BigMenuItem extends StatefulWidget {
  MenuModel menuModel;

  BigMenuItem(this.menuModel){
    //  print("Active: ${menuModel.id}----------");
  }

  @override
  State<BigMenuItem> createState() => _BigMenuItemState();
}

class _BigMenuItemState extends State<BigMenuItem> with TickerProviderStateMixin {
  final Duration animationDuration = const Duration(seconds: 6);


  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
        color: Colors.white,
      ),
      end: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
        //color: panel_orange_accent,
        color: panel_orange_accent,
      )
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,

    reverseDuration: const Duration(milliseconds: 500),
    duration: const Duration(milliseconds: 500),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _controller.forward();
    if(widget.menuModel.id==0){
      _controller.forward();
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MenuVM>().addListener(() {
        //  print("listener ${widget.menuModel.id}");
        var current_item =  context.read<MenuVM>().active_item;
        var pre_item =  context.read<MenuVM>().pre_item;
        if(current_item==widget.menuModel.id){
          _controller.forward();
          setState(() {

          });
        }
        if(pre_item==widget.menuModel.id){
          // _controller.reset();
          _controller.reverse();
          setState(() {

          });
        }
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    // print("Item ${widget.menuModel.id}");
    return InkWell(
      onTap: () {
        // print("---------CLicked--------");

        context.read<MenuVM>().setActiveItem(widget.menuModel.id);

      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),

        padding: EdgeInsets.all(7),
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),

          child: Container(
            alignment: Alignment.center,

            padding: EdgeInsets.symmetric(vertical: 10),

            child: Icon(
              widget.menuModel.iconData,
              size: widget.menuModel.active ==true? 24 : 26,
              color: widget.menuModel.active ==true? panel_orange : panel_grey,
            ),
          ),
        ),
      ),
    );
  }
}