import 'package:cv_builder/mvvm/model/entity/template_model.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../../config/localize/languages.dart';
import '../../../../../config/locator.dart';
import '../../../../../mvvm/viewmodel/template_viewmodel.dart';
import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/screen_size.dart';
import '../../../../../util/constant/string_const.dart';

class TemplateItem extends StatelessWidget {

  TemplateModel templateModel;
  TemplateItem({required this.templateModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(context: context, builder: (context) {
          return  Dialog.fullscreen(

            child: Container(
                padding: EdgeInsets.symmetric(horizontal: sl<ScreenSize>().width * 0.04 ),
               // title:
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height:  sl<ScreenSize>().height * 0.02),
                 InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                   child:  Container(
                     width: 40,
                     height: 40,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: primary_surface,
                     ),
                     child: Icon(Icons.cancel_outlined,size: 20,color: work_text ,),
                   ),
                 ),
                  SizedBox(height:  sl<ScreenSize>().height * 0.02),
                  Text( AppLocale.template_preview_title.getString(context)+templateModel.id.toString(),
                    style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height:  sl<ScreenSize>().height * 0.02),
                   SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all( 2),
                        alignment: Alignment.center,

                        child: Image.asset(templateModel.img_path!,width:(sl<ScreenSize>().height * 0.75)*0.85,
                          height:  sl<ScreenSize>().height * 0.75,
                          fit: BoxFit.fill,),
                      ),
                    )

                ],
              ),

            ),
          );
        },);
      },
      onTap: () {
        Provider.of<TemplateVM>(context, listen: false).TemplateClick(templateModel) ;

      },
      child: Container(
      //  height: 180,
         //   width: 150,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all( 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(inner_radius)),
          color: templateModel.selected==true?primary_container:Color(0xffefefef),
        ),
        child: Image.asset(templateModel.img_path!,width: 80,height: 80,fit: BoxFit.fill,),
      ),
    );

  }
}
