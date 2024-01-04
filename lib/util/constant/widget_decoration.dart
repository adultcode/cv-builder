import 'dart:ui';

import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';

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
