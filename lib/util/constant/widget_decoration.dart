import 'dart:ui';

import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';

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
    color: backgroud_color
);


InputDecoration input_text_decoration({required String hint,required TextStyle style}){
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
    hintStyle:  style,
  //  hintStyle:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: panel_grey),
    hintText: hint,
    hintTextDirection: TextDirection.rtl,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
  );
}