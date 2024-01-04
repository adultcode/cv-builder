import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';

class ProfileEditBig extends StatelessWidget {
  const ProfileEditBig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('s')
          ],
        ),
      ),
    );
  }
}
