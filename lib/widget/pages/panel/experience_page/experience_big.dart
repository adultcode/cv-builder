import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';

class ExperienceBig extends StatefulWidget {
  const ExperienceBig({Key? key}) : super(key: key);

  @override
  State<ExperienceBig> createState() => _ExperienceBigState();
}

class _ExperienceBigState extends State<ExperienceBig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.02 ),
      child: SingleChildScrollView(
        child: Text("fdhbjsam"),
      ),
    );
  }
}
