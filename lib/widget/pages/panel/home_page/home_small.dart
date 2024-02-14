import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/widget/custom_widgets/panel/menu/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../mvvm/model/entity/template_model.dart';
import '../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../mvvm/viewmodel/user_viewmodel.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
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

  @override
  Widget build(BuildContext context) {
    return DashboarHelper(
      fab: FloatingActionButton.extended(

        backgroundColor: primary_container,
        label: Text("دریافت رزومه",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 13),),
        onPressed: () async{
          if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
            // DownloadCV(value.userModel!);
          var result = await Provider.of<TemplateVM>(context, listen: false).DownloadCVAndroid(userModel);
          if(result){
            SuccessSnack(context: context,title: "رزومه شما با موفقیت دانلود شد");

          }else{
            ErrorSnack(context: context,title: "خطایی رخ داده است");

          }
           //  Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(userModel: userModel,
           //  selected_template: Provider.of<TemplateVM>(context, listen: false).getSelected()),));

          }
          else{
            ErrorSnack(context: context,title: "هیچ قالبی انتخاب نکرده اید");
          }
        },
      ),
      appBar: AppBar(
      title: Text("پروفایل"),
        centerTitle: true,

      ),

      drawer: MobileDrawer(),
      body: Container(
        height: sl<ScreenSize>().height,
        //color: primary_btn,
        //decoration: panel_container_decoration,
          padding: EdgeInsets.symmetric(
              vertical: sl<ScreenSize>().height * 0.02,
              horizontal: sl<ScreenSize>().width * 0.02),

          child: Consumer<UserViewModel>(
            builder: (context, value, child) {
                userModel = value.userModel!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  // SizedBox(
                  //   height: sl<ScreenSize>().height * 0.02,
                  // ),
                  Text(
                    'خوش آمدید '+"${value.userModel?.infoModel?.name?? ""}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'قالب رزومه مورد نظر خود را از لیست زیر انتخاب نمایید ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Consumer<TemplateVM>(builder: (context, value, child) {
                    if(value.template_list!=null){
                      return   Container(
                        height: sl<ScreenSize>().height*0.7,
                        //   color: Colors.green,
                        child:
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: GridView.builder(

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
      ),
    );
  }
}
