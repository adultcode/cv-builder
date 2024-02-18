import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/viewmodel/template_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/template_item.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/string_const.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../cv/cv1/cv1.dart';
import '../../cv/pdf_page.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeBigPage extends StatefulWidget {
  const HomeBigPage({Key? key}) : super(key: key);

  @override
  State<HomeBigPage> createState() => _HomeBigPageState();
}

class _HomeBigPageState extends State<HomeBigPage> {


 List<TemplateModel> template_list = [];

 // void DownloadCV(UserModel userModel)async{
 //  // PdfPageFormat format = PdfPageFormat();
 //   List<int> fileInts = List.from(await generateResumeCV1(PdfPageFormat.a4,userModel:userModel ));
 //   html.AnchorElement(
 //       href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
 //     ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
 //     ..click();
 //
 // }
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
    return Container(
        height: sl<ScreenSize>().height,
        decoration: panel_container_decoration,
        padding: EdgeInsets.symmetric(
            vertical: sl<ScreenSize>().height * 0.02,
            horizontal: sl<ScreenSize>().width * 0.02),

          child: Consumer<UserViewModel>(
            builder: (context, value, child) {

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  SizedBox(
                    height: sl<ScreenSize>().height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: panel_green,
                          padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10)
                        ),
                        onPressed: () async{
                          Provider.of<TemplateVM>(context, listen: false).DownloadCV(value.userModel!);
                          // if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
                          //   // DownloadCV(value.userModel!);
                          //   var result = await Provider.of<TemplateVM>(context, listen: false).DownloadCV(value.userModel!);
                          //   if(result){
                          //     SuccessSnack(context: context,title: StringConst.home_cv_downloaded);
                          //
                          //   }else{
                          //     ErrorSnack(context: context,title: StringConst.home_no_template_choosed);
                          //
                          //   }
                          //
                          // }
                          // else{
                          //   ErrorSnack(context: context,title: StringConst.home_no_template_choosed);
                          // }
                        },
                        child: Text(StringConst.download_cv,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                      ),
                      Text(
                         StringConst.home_profile,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      
                    ],
                  ),
                  Text(
                    StringConst.home_welcome+"${value.userModel?.infoModel?.name?? ""}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    StringConst.home_subtitle,
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
