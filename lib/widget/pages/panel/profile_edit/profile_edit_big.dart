import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../custom_widgets/panel/input_label.dart';

class ProfileEditBig extends StatelessWidget {

  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var bio_controller = TextEditingController();
  var jobtitle_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.02 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('اطلاعات شخصی',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 10,),
            Text('ویرایش اطلاعات و مشخصات شخصی ',style: Theme.of(context).textTheme.bodyMedium,),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: sl<ScreenSize>().width*0.05),
                Expanded(
                    child: InputLabel(hint: 'آدرس ایمیل',name: 'ایمیل',textEditingController: email_controller,)
                ),
                SizedBox(width: sl<ScreenSize>().width*0.05),
                Expanded(
                    child: InputLabel(hint: 'نام و نام خانوادگی',name: 'نام',textEditingController: name_controller,)
                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}
