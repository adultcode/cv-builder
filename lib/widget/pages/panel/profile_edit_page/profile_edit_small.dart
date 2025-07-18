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

import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../mvvm/model/entity/info_model/info_model.dart';
import '../../../../mvvm/viewmodel/info_viewmodel.dart';
import '../../../../mvvm/viewmodel/menu_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/radius_size.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/change_avatar.dart';
import '../../../custom_widgets/panel/input_form.dart';
import '../../../custom_widgets/panel/input_label.dart';
import '../dashboard_page.dart';
import '../home_page/home_small.dart';
import 'package:flutter_localization/flutter_localization.dart';
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
      canPop: false,
      onPopInvoked: (v)async {
        Provider.of<MenuVM>(context,listen: false).setActiveItem(0);
        //   return false;
      },
      child: DashboarHelper(

        drawer: MobileDrawer(),
        appBar: AppBar(
          surfaceTintColor: panel_orange,
        primary: true,
        shadowColor: Colors.black54,
          title: Text(AppLocale.personal_info.getString(context)),
          centerTitle: true,
          leadingWidth: 55,
          leading:        InkWell(
            onTap: () async{
              if(_formKey.currentState?.validate()==true){
                var resul = await     Provider.of<InfoVM>(context,listen: false).SaveInfoData();
              if(resul==true)     SuccessSnack(context: context,title: AppLocale.success_submit.getString(context));

              else     ErrorSnack(context: context,title:  AppLocale.error.getString(context));

              }
              else{
                ErrorSnack(context: context,title: AppLocale.fill_all.getString(context));
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

                        Text(AppLocale.personal_info_subtitle.getString(context),style: Theme.of(context).textTheme.bodyMedium,),
                        SizedBox(height: 30,),

                        /*
                  first row
                  email and name field
                   */

                            SizedBox(width: sl<ScreenSize>().width*0.05),
                            /*
                      email field
                       */
                            InputLabel(hint:AppLocale.email_hint.getString(context),name: AppLocale.email.getString(context),textEditingController: value.email_controller,),

                            SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */
                            InputLabel(hint: AppLocale.name_hint.getString(context),name: AppLocale.name.getString(context),textEditingController: value.name_controller,)
                        ,



                        /*
                  second row
                  job and mobile field
                   */

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      phone field
                       */
                             InputLabel(hint: AppLocale.mobile_hint.getString(context),name: AppLocale.mobile.getString(context),textEditingController: value.phone_controller,isNumber: true,
                                  max_length: 11,),

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */
                             InputLabel(hint: AppLocale.bio_job_hint.getString(context),name: AppLocale.bio_job.getString(context),textEditingController: value.jobtitle_controller,),



                        /*
                  third row
                  birth and city field
                   */
                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      birth field
                       */
                       InputLabel(hint: AppLocale.birthday_date.getString(context),name: AppLocale.birthday.getString(context),textEditingController: value.birth_controller,),
                        SizedBox(height: sl<ScreenSize>().height*0.02),
                            /*
                      name field
                       */InputLabel(hint: AppLocale.location_hint.getString(context),name: AppLocale.city.getString(context),textEditingController: value.city_controller,),


                        /*
                  fourth row
                  profile and bio
                   */

                        SizedBox(height: sl<ScreenSize>().height*0.02),
                        /*
                      desc field
                       */
                        InputForm(hint: AppLocale.bio.getString(context),name: AppLocale.bio.getString(context),textEditingController: value.bio_controller,),
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
