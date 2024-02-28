import 'dart:io';
import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/profile_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../config/localize/languages.dart';
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

class ProfileEditBig extends StatefulWidget {

  @override
  State<ProfileEditBig> createState() => _ProfileEditBigState();
}

class _ProfileEditBigState extends State<ProfileEditBig> {


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
  Widget build(BuildContext context) {
    return Container(
      height: sl<ScreenSize>().height,
      decoration: panel_container_decoration,
      padding: EdgeInsets.symmetric(vertical: sl<ScreenSize>().height*0.02,horizontal:  sl<ScreenSize>().width*0.02 ),
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
                 value.PopulateForm();
             }
            return  Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: sl<ScreenSize>().height*0.02,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
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
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: panel_green_accent,
                          ),
                          child: Icon(Icons.done,size: 20,color: panel_green,),
                        ),
                      ),
                      Text( AppLocale.personal_info.getString(context),style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(AppLocale.personal_info_subtitle.getString(context),style: Theme.of(context).textTheme.bodyMedium,),
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
                          child: InputLabel(hint: AppLocale.email_hint.getString(context),name: AppLocale.email.getString(context),textEditingController: value.email_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  name field
                   */
                      Expanded(
                          child: InputLabel(hint: AppLocale.name_hint.getString(context),name: AppLocale.name.getString(context),textEditingController: value.name_controller,)
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
                  phone field
                   */
                      Expanded(
                          child: InputLabel(hint: AppLocale.mobile_hint.getString(context),name: AppLocale.mobile.getString(context),textEditingController: value.phone_controller,isNumber: true,
                          max_length: 11,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  name field
                   */
                      Expanded(
                          child: InputLabel(hint: AppLocale.bio_job_hint.getString(context),name: AppLocale.bio_job.getString(context),textEditingController: value.jobtitle_controller,)
                      ),


                    ],
                  ),
                  /*
              third row
              birth and city field
               */
                  SizedBox(height: sl<ScreenSize>().height*0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  birth field
                   */
                      Expanded(
                          child: InputLabel(hint:AppLocale.birthday_date.getString(context),name: AppLocale.birthday.getString(context),textEditingController: value.birth_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  name field
                   */
                      Expanded(
                          child: InputLabel(hint: AppLocale.location_hint.getString(context),name: AppLocale.city.getString(context),textEditingController: value.city_controller,)
                      ),


                    ],
                  ),
                  /*
              fourth row
              profile and bio
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
                          child: Consumer<ProfileProvider>(
                            builder: (context, value, child) {
                            //  print("Consumer ${value.img_byte?.isEmpty}");
                              return ChangeAvatar(profile_img: value.img_byte!=null?value.img_byte:null);
                            },
                          )
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  name field
                   */
                      Expanded(
                          child: InputForm(hint: AppLocale.bio.getString(context),name: AppLocale.bio.getString(context),textEditingController: value.bio_controller,)
                      ),


                    ],
                  )

                ],
              ),
            );
          },
        )
      ),
    );
  }

}
