import 'dart:convert';
import 'dart:ui';

import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/privacy_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/setting_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/template_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/template_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import '../../../custom_widgets/panel/dashboard/modal/language_setting.dart';
import '../../../custom_widgets/panel/dashboard/modal/privacy_modal.dart';

class HomeBigPage extends StatefulWidget {
  const HomeBigPage({Key? key}) : super(key: key);

  @override
  State<HomeBigPage> createState() => _HomeBigPageState();
}

class _HomeBigPageState extends State<HomeBigPage> {


 List<TemplateModel> template_list = [];
final FlutterLocalization localization = FlutterLocalization.instance;


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getPrivacy();
    WidgetsFlutterBinding.ensureInitialized()
        .scheduleFrameCallback((timeStamp) async{
      Provider.of<UserViewModel>(context, listen: false).GetUserModel() ;
      Provider.of<TemplateVM>(context, listen: false).GetTemplateList() ;
      if(await Provider.of<SettingVM>(context, listen: false).CheckSetting()==false ){
        ShowSetting(context);
      }
    });
  }

  void getPrivacy()async{
    final String response = await rootBundle.loadString('assets/data/privacy_fa.txt');

    //pri
    // nt(response);


  }

  // privacy modal
 // Widget PrivacyModal(){
 //    Provider.of<PrivacyVM>(context).GetPrivacyText(1);
 //    return Container(
 //      height: sl<ScreenSize>().height*0.7,
 //      width: MediaQuery.of(context).size.width,
 //      padding: EdgeInsets.symmetric(horizontal: 15,
 //          vertical: sl<ScreenSize>().height*0.02),
 //      decoration: BoxDecoration(
 //          color: Colors.white,
 //          borderRadius: BorderRadius.all(Radius.circular(outer_radius))
 //
 //      ),
 //      child: Column(
 //        crossAxisAlignment: CrossAxisAlignment.end,
 //        children: [
 //          Row(
 //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
 //
 //            children: [
 //              IconButton(onPressed: () {
 //                Navigator.pop(context);
 //              }, icon: Icon(Icons.cancel_outlined,size: 28,color: black_title,)),
 //              Text("حریم خصوصی",
 //              style: Theme.of(context).textTheme.bodyLarge,)
 //             // Text(AppLocale.accept_privacy.getString(context))
 //            ],
 //          ),
 //          Expanded(child: Container(
 //            width: MediaQuery.of(context).size.width,
 //            //  color:Colors.amberAccent,
 //            child: SingleChildScrollView(
 //              child: Container(
 //                alignment: Alignment.topRight,
 //                //     color:Colors.amberAccent,
 //                child: Consumer<PrivacyVM>(
 //                  builder: (context, value, child) {
 //                    if(value.privacy_text==null){
 //                      return Text("Loading..");
 //                    }else{
 //                    return  Text(value.privacy_text!,
 //                    textDirection: TextDirection.rtl,
 //                    textAlign: TextAlign.right,);
 //                    }
 //                  },
 //                ),
 //              ),
 //            ),
 //          )),
 //          Container(
 //            // color:Colors.amberAccent,
 //            margin: EdgeInsets.symmetric(vertical: 10),
 //            alignment: Alignment.center,
 //            child:     ElevatedButton(
 //              style: ElevatedButton.styleFrom(
 //                backgroundColor:  primary_container,
 //              ),
 //              onPressed: () {
 //
 //              },
 //              child: Text( AppLocale.accept_privacy.getString(context),
 //                  style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title)),
 //            ),
 //          )
 //        ],
 //      ),
 //    );
 // }

  // Show fab widget and loading
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
     return  Row(
       children: [
        ElevatedButton(

         style: ElevatedButton.styleFrom(
         backgroundColor: panel_green,
             padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10)
         ),
           onPressed: () async{

           // check privacy policy accepted or not
             if(await  Provider.of<PrivacyVM>(context,listen: false).isChecked()==false){
               // show privacy modal to the user
               showModalBottomSheet(context: context, builder: (context) {
                 return PrivacyModal();
               },);
             }else{
               // resume building process
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
             }



           },
           child: Text(AppLocale.download_cv.getString(context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
           ),
         SizedBox(width: 5,),

         IconButton(onPressed: () {
           ShowSetting(context);

         }, icon: Icon(Icons.settings,color: work_text,))
       ],
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

              // initial the userModel
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
