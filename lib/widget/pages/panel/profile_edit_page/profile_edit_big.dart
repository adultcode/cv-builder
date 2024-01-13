import 'dart:io';
import 'dart:ui';

import 'package:cv_builder/model/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/profile_provider.dart';
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

class ProfileEditBig extends StatefulWidget {

  @override
  State<ProfileEditBig> createState() => _ProfileEditBigState();
}

class _ProfileEditBigState extends State<ProfileEditBig> {
  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var bio_controller = TextEditingController();
  var jobtitle_controller = TextEditingController();
  var city_controller = TextEditingController();
  var birth_controller = TextEditingController();

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
  void PopulateForm(InfoModel _infoModel){
    name_controller.text = _infoModel.name!;
    jobtitle_controller.text = _infoModel.job!;
    bio_controller.text = _infoModel.bio!;
    phone_controller.text = _infoModel.mobile!;
    email_controller.text = _infoModel.email!;
    city_controller.text = _infoModel.city!;
    birth_controller.text = _infoModel.birth!;
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
                 PopulateForm(value.infoModel!);
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
                          //   Provider.of<InfoVM>(context,listen: false).GetInfoModelData();


                          /*
                      save user's data
                       */
                          if (_formKey.currentState!.validate()) {

                            /*
                             If the form is valid, display a snackbar,
                             save data in shared prefences

                             */
                            SuccessSnack(context: context,title: 'اطلاعات شما ثبت شد');

                            InfoModel userm = InfoModel(email: email_controller.text,
                            name: name_controller.text,
                                bio: bio_controller.text,
                                job: jobtitle_controller.text,
                                mobile: phone_controller.text,
                                city: city_controller.text,
                                birth: birth_controller.text,);
                            Provider.of<InfoVM>(context,listen: false).SaveInfoData(infoModel: userm);
                           // print(userm.toJson());

                          }
                          else{
                            print("-------Invalid Form");
                            ErrorSnack(context: context,title: 'تمام مقادیر را تکمیل کنید');

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
                      Text('اطلاعات شخصی',style: Theme.of(context).textTheme.titleLarge,)

                    ],
                  ),
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
                          child: InputLabel(hint: 'شماره تماس',name: 'موبایل',textEditingController: phone_controller,isNumber: true,)
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
                          child: InputLabel(hint: '1390/10-1',name: 'تاریخ تولد',textEditingController: birth_controller,)
                      ),
                      SizedBox(width: sl<ScreenSize>().width*0.05),
                      /*
                  name field
                   */
                      Expanded(
                          child: InputLabel(hint: 'محل زندگی',name: 'شهر',textEditingController: city_controller,)
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
                              print("Consumer ${value.img_byte?.isEmpty}");
                              return ChangeAvatar(profile_img: value.img_byte!=null?value.img_byte:null);
                            },
                          )
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
            );
          },
        )
      ),
    );
  }

}
