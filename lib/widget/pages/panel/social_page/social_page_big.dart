import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';

class SocialPageBig extends StatefulWidget {
  const SocialPageBig({Key? key}) : super(key: key);

  @override
  State<SocialPageBig> createState() => _SocialPageBigState();
}

class _SocialPageBigState extends State<SocialPageBig> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.white,
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      child: Text("SOcial page"),
    );

  }
}
