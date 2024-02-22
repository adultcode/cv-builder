import 'dart:io';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import '../../../../config/locator.dart';
import '../../../../main.dart';
import '../../../../mvvm/model/entity/template_model.dart';
import '../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../mvvm/viewmodel/user_viewmodel.dart';
import '../../../../notification_controller.dart';
import '../../../../util/constant/android_version.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../../custom_widgets/panel/dashboard/items/template_item.dart';
import '../../cv/pdf_page.dart';
import '../dashboard/dashboard_small.dart';

class HomePageSmall extends StatefulWidget {
  const HomePageSmall({Key? key}) : super(key: key);

  @override
  State<HomePageSmall> createState() => _HomePageSmallState();
}

class _HomePageSmallState extends State<HomePageSmall> {


  List<TemplateModel> template_list = [];
  late UserModel userModel;
  late AwesomeNotifications notifications;






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
    if(isLoading) return LinearProgressIndicator(
      backgroundColor: primary_container,
      color: panel_orange,
      minHeight: 3,
    );
    else return FloatingActionButton.extended(

      backgroundColor: primary_container,
      label: Text(StringConst.download_cv,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13),),
      onPressed: () async{



        if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
          // DownloadCV(value.userModel!);
          var result = await Provider.of<TemplateVM>(context, listen: false).DownloadCV();
          if(result){
            SuccessSnack(context: context,title: StringConst.home_cv_downloaded);

          }else{
            ErrorSnack(context: context,title: StringConst.home_cv_error);

          }

        }
        else{
          ErrorSnack(context: context,title: StringConst.home_no_template_choosed);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      fab: Consumer<TemplateVM>(builder: (context, value, child){
        return FabOrIndicator(value.loading);
    }),
      appBar: AppBar(
      title: Text(StringConst.home_profile),
        centerTitle: true,

      ),

      drawer: MobileDrawer(),
      body: Container(
        height: sl<ScreenSize>().height,
        //color: primary_btn,

        //decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.04),

          child: Consumer<UserViewModel>(
            builder: (context, value, child) {
              Provider.of<TemplateVM>(context, listen: false).userModel = value.userModel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [


                  Text(
                    StringConst.home_welcome+" ${value.userModel?.infoModel?.name?? ""}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    StringConst.home_subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Consumer<TemplateVM>(builder: (context, value, child) {
                    if(value.template_list!=null){
                      return   Container(
                        height: sl<ScreenSize>().height*0.6,
                        //   color: Colors.green,
                        child:
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.builder(

                            // shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // number of items in each row
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
      ),
    );
  }
}
