import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../custom_widgets/panel/change_avatar.dart';
import '../../../custom_widgets/panel/input_form.dart';
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

            /*
            first row
            email and name field
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                email field
                 */
                Expanded(
                    child: InputLabel(hint: 'آدرس ایمیل',name: 'ایمیل',textEditingController: email_controller,)
                ),
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                name field
                 */
                Expanded(
                    child: InputLabel(hint: 'نام و نام خانوادگی',name: 'نام',textEditingController: name_controller,)
                ),


              ],
            ),
            /*
            second row
            job and mobile field
             */
            SizedBox(height: sl<ScreenSize>().height*0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                email field
                 */
                Expanded(
                    child: InputLabel(hint: 'شماره تماس',name: 'موبایل',textEditingController: phone_controller,)
                ),
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                name field
                 */
                Expanded(
                    child: InputLabel(hint: 'عنوان شغلی',name: 'شغل',textEditingController: jobtitle_controller,)
                ),


              ],
            ),
            /*
            third row
            email and name field
             */
            SizedBox(height: sl<ScreenSize>().height*0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                Change avatar section
                 */
                Expanded(
                    child: ChangeAvatar()
                ),
                SizedBox(width: sl<ScreenSize>().width*0.05),
                /*
                name field
                 */
                Expanded(
                    child: InputForm(hint: 'درباره خودتان توضیحاتی را بنویسید',name: 'بیوگرافی',textEditingController: bio_controller,)
                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}
