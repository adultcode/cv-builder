import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/mvvm/viewmodel/template_viewmodel.dart';
import 'package:cv_builder/mvvm/viewmodel/user_viewmodel.dart';
import 'package:cv_builder/widget/custom_widgets/panel/dashboard/items/template_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/locator.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/screen_size.dart';
import '../../../../util/constant/widget_decoration.dart';
import '../../../../util/warning/snack_bar.dart';
import '../../cv/pdf_page.dart';

class HomeBigPage extends StatefulWidget {
  const HomeBigPage({Key? key}) : super(key: key);

  @override
  State<HomeBigPage> createState() => _HomeBigPageState();
}

class _HomeBigPageState extends State<HomeBigPage> {


 List<TemplateModel> template_list = [];
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
                        onPressed: () {
                          if(  Provider.of<TemplateVM>(context, listen: false).getSelected()!=null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(userModel: value.userModel,
                            selected_template: Provider.of<TemplateVM>(context, listen: false).getSelected()),));

                          }
                          else{
                            ErrorSnack(context: context,title: "هیچ قالبی انتخاب نکرده اید");
                          }
                        },
                        child: Text("دریافت رزومه",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                      ),
                      Text(
                        'پروفایل ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      
                    ],
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
