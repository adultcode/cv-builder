import 'dart:convert';
import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/setting_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/template_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/template_item.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

import '../../../../config/localize/languages.dart';
import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/dashboard/items/language_setting_item.dart';

class HomeBigPage extends StatefulWidget {
  const HomeBigPage({Key? key}) : super(key: key);

  @override
  State<HomeBigPage> createState() => _HomeBigPageState();
}

class _HomeBigPageState extends State<HomeBigPage> {


 List<TemplateModel> template_list = [];
final FlutterLocalization localization = FlutterLocalization.instance;

ShowSetting(BuildContext context){

  showDialog(context:context,

  builder: (context) {
    return AlertDialog(

      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.only(left: 5,top: 3),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      title:  Align(
        alignment: Alignment.topLeft,
        child: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_circle_left_outlined,size: 28,color: primary_title,)),
      ),
      content: Container(
        child: Consumer<SettingVM>(
          builder: (context, value, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/25.png',width: 150,height: 150,),
                SizedBox(height: 20,),
                Text(AppLocale.lang_setting_title.getString(context),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primary_title),),
                SizedBox(height: 20,),
                Container(
                  height: sl<ScreenSize>().height*0.06,
                  //  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //second option
                      Expanded(child: LangSettingItem(flag: "assets/iran.png",
                        isActive: value.current_language==1?true:false,
                        title: "فارسی",),),

                      SizedBox(width: 10,),
                      // first option
                      Expanded(
                          child: LangSettingItem(flag: "assets/english.png",
                            isActive: value.current_language==2?true:false,
                            title: StringConst.english_flag,)
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,)

              ],
            );
          },
        )
      ),
    );
  }
    );

}
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).GetUserModel() ;
      Provider.of<TemplateVM>(context, listen: false).GetTemplateList() ;
    });
  }

 Widget FabOrIndicator(bool isLoading){
   if(isLoading) {
     return Expanded(
     child: Container(
       margin: EdgeInsets.only(right: 30),
       height: 4,
       width: 100,
       child: LinearProgressIndicator(
         backgroundColor: primary_container,
         color: panel_orange,
         minHeight: 3,
       ),
     ),
   );
   } else {
     return  ElevatedButton(

       style: ElevatedButton.styleFrom(
           backgroundColor: panel_green,
           padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10)
       ),
       onPressed: () async{
         ShowSetting(context);
         // localization.translate("en");
      //   print("change translate");
         // setState(() {
         //
         // });
         if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
           // DownloadCV(value.userModel!);
           var result = await Provider.of<TemplateVM>(context, listen: false).DownloadCV();
           if(result){
             SuccessSnack(context: context,title: AppLocale.home_cv_downloaded.getString(context));

           }else{
             ErrorSnack(context: context,title: AppLocale.home_cv_error.getString(context));

           }

         }
         else{
           ErrorSnack(context: context,title: AppLocale.home_no_template_choosed.getString(context));
         }
       },
       child: Text(AppLocale.download_cv.getString(context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
     );
   }
 }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: sl<ScreenSize>().height,
        decoration: panel_container_decoration,
        padding: EdgeInsets.symmetric(
            vertical: sl<ScreenSize>().height * 0.02,
            horizontal: sl<ScreenSize>().width * 0.02),

          child: Consumer<UserViewModel>(
            builder: (context, value, child) {

              Provider.of<TemplateVM>(context, listen: false).userModel = value.userModel;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Container(
        //            height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<TemplateVM>(builder: (context, value, child){
                              return FabOrIndicator(value.loading);
                            }),
                            Text(
                              AppLocale.home_welcome.getString(context)+" ${value.userModel?.infoModel?.name?? ""}",

                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocale.home_subtitle.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textDirection: TextDirection.rtl,

                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),



                   Consumer<TemplateVM>(builder: (context, value, child) {
                     if(value.template_list!=null){
                       return   Expanded(
                         child: Container(
                                               //   height: sl<ScreenSize>().height*0.70,
                       //       color: Colors.green,
                           child:
                           GridView.builder(
                             // shrinkWrap: true,
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3, // number of items in each row
                               mainAxisSpacing: sl<ScreenSize>().height*0.02, // spacing between rows
                               crossAxisSpacing: sl<ScreenSize>().width*0.04, // spacing between columns
                               childAspectRatio: 0.85
                             ),
                             itemCount: value.template_list?.length, // total number of items

                             itemBuilder: (context, index) {
                               return TemplateItem(templateModel: value.template_list![index]);
                             },),
                         ),
                       );
                     }else return Container();
                   },),


                ],
              );
            },

        )

    );
  }
}
