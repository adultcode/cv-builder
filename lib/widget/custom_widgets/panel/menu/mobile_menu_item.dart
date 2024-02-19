import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/menu_model.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/radius_size.dart';

class MobileMenuItem extends StatefulWidget {
  MenuModel menuModel;

  MobileMenuItem(this.menuModel){
    //  print("Active: ${menuModel.id}----------");
  }

  @override
  State<MobileMenuItem> createState() => _MobileMenuItemState();
}

class _MobileMenuItemState extends State<MobileMenuItem>  {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _controller.forward();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MenuVM>().addListener(() {
        //  print("listener ${widget.menuModel.id}");
        var current_item =  context.read<MenuVM>().active_item;
        var pre_item =  context.read<MenuVM>().pre_item;
        if(current_item==widget.menuModel.id){
          setState(() {

          });
        }
        if(pre_item==widget.menuModel.id){
          // _controller.reset();
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
       // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),

        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:  Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
              color: widget.menuModel.active==true? primary_surface:Colors.transparent
            ),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Expanded(child: Text(widget.menuModel.title!,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: menu_font,
                      fontWeight: widget.menuModel.active ==true? FontWeight.w800 : FontWeight.w500,
                      color: widget.menuModel.active==true? panel_orange:black_title ),)),
                SizedBox(width: 20,),
                Icon(
                  widget.menuModel.iconData,
                  size: widget.menuModel.active ==true? 24 : 22,
                  color: widget.menuModel.active ==true? panel_orange : panel_grey,

                ),
              ],
            )
          ),

      ),
    );
  }
}