import 'dart:ui';

import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:cv_builder/util/constant/screen_size.dart';
import 'package:flutter/material.dart';

import '../../config/locator.dart';
import 'color.dart';

var panel_container_decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(outer_radius)),
    border: Border.all(
      color: Color(0xffeff0f3),
//width: 3
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.black12.withOpacity(0.1),
          offset: Offset(2, 2),
          spreadRadius: 1,
          blurRadius: 10)
    ]);

var input_decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
    border: Border.all(width: 2
        ,color: backgroud_color),
    color: input_bg);

/*
decoration for textformfield
 */
InputDecoration input_text_decoration(
    {required String hint,
    required TextStyle style,
    required TextEditingController controller}) {
  return InputDecoration(
    counterText: "",
    errorStyle: TextStyle(
     color: Colors.black,
      fontSize: 0,

    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 5,
        vertical: sl<ScreenSize>().width<ScreenSize.smallwidth?15:21
    ),
    hintStyle: style,
    hintText: hint,

    prefixIcon: Column(
      children: [
        IconButton(
            alignment: Alignment.topCenter,

            icon: Icon(
              Icons.clear,
              size: 18,
              color: panel_grey,
            ),
            onPressed: () {
              controller.clear();
            })
      ],
    ),
    hintTextDirection: TextDirection.rtl,
  //hoverColor: Colors.green,
   focusedBorder: InputBorder.none,
   enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    errorBorder: InputBorder.none,


  );
}
