import 'dart:io';
import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/profile_provider.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:cv_builder/widget/pages/panel/dashboard/dashboard_small.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/model/entity/info_model/info_model.dart';
import '../../../../mvvm/viewmodel/info_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/change_avatar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';
import '../dashboard_page.dart';

class ProfileEditSmall extends StatefulWidget {

  @override
  State<ProfileEditSmall> createState() => _ProfileEditSmallState();
}

class _ProfileEditSmallState extends State<ProfileEditSmall> {


  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /// call to get Data
    WidgetsFlutterBinding.ensureInitialized().scheduleFrameCallback((timeStamp) {
      // context.watch<InfoVM>().GetInfoModelData();
      Provider.of<InfoVM>(context,listen: false).GetInfoModelData();
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
     onPopInvoked: (didPop) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));

     },
      child: DashboarHelper(

        drawer: MobileDrawer(),
        appBar: AppBar(
          surfaceTintColor: panel_orange,
        primary: true,
        shadowColor: Colors.black54,
          title: Text("اطلاعات شخصی"),
          centerTitle: true,
          leadingWidth: 55,
          leading:        InkWell(
            onTap: () async{
              if(_formKey.currentState?.validate()==true){
                var resul = await     Provider.of<InfoVM>(context,listen: false).SaveInfoData();
              if(resul==true)     SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');

              else     ErrorSnack(context: context,title: 'خطایی رخ داده است');

              }
              else{
                ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');
              }
            },
            child: Container(
              margin: EdgeInsets.only(left:sl<ScreenSize>().width*0.04 ),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: panel_green_accent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5
                  )
                ]
              ),
              child: Icon(Icons.done,size: 20,color: panel_green,),
            ),
          )
          ,
        ),
        body: Container(
          height: sl<ScreenSize>().height,
         // decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.04 ),
          child: SingleChildScrollView(
            /*
            form widget
             */
              child:Consumer<InfoVM>(
                builder: (context, value, child) {

                  /*
                check if data get from shared prefences
                populate the form inputs
                 */
                  if(value.infoModel!=null){
                   // PopulateForm(value.infoModel!);
                    value.PopulateForm();
                  }
                  return  Form(
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text('ویرایش اطلاعات و مشخصات شخصی ',style: Theme.of(context).textTheme.bodyMedium,),
                        SizedBox(height: 30,),

                        /*
                  first row
                  email and name field
                   */

                            SizedBox(width: sl<ScreenSize>().width*0.05),
                            /*
                      email field
                       */
                            InputLabel(hint: 'آدرس ایمیل',name: 'ایمیل',textEditingController: value.email_controller,),

                            SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */
                            InputLabel(hint: 'نام و نام خانوادگی',name: 'نام',textEditingController: value.name_controller,)
                        ,



                        /*
                  second row
                  job and mobile field
                   */

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      phone field
                       */
                             InputLabel(hint: 'شماره تماس',name: 'موبایل',textEditingController: value.phone_controller,isNumber: true,
                                  max_length: 11,),

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */
                             InputLabel(hint: 'عنوان شغلی',name: 'شغل',textEditingController: value.jobtitle_controller,),



                        /*
                  third row
                  birth and city field
                   */
                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      birth field
                       */
                       InputLabel(hint: '1390/10-1',name: 'تاریخ تولد',textEditingController: value.birth_controller,),
                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */InputLabel(hint: 'محل زندگی',name: 'شهر',textEditingController: value.city_controller,),


                        /*
                  fourth row
                  profile and bio
                   */

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                        /*
                      desc field
                       */
                        InputForm(hint: 'درباره خودتان توضیحاتی را بنویسید',name: 'بیوگرافی',textEditingController: value.bio_controller,),
                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      Change avatar section
                       */
                            Consumer<ProfileProvider>(
                                  builder: (context, value, child) {
                                    //  print("Consumer ${value.img_byte?.isEmpty}");
                                    return ChangeAvatar(profile_img: value.img_byte!=null?value.img_byte:null);
                                  },
                                ),
                        SizedBox(height: sl<ScreenSize>().height*0.02),




                      ],
                    ),
                  );
                },
              )
          ),
        ),
      ),
    );
  }

}
