import 'dart:math';

import 'package:cv_builder/config/localize/languages.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/viewmodel/language_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../../config/locator.dart';
import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/radius_size.dart';
import '../../../../../util/constant/screen_size.dart';
import '../../../../../util/constant/string_const.dart';

class LanguageItem extends StatelessWidget {

  LanguageModel languageModel;
  double _margin_percent = 0;

  LanguageItem({required this.languageModel}){
    _margin_percent = 5 - languageModel.percent!.toDouble();
    _margin_percent = _margin_percent/5;
  }

  void ShodDialogItem(BuildContext context){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_circle_left_outlined,size: 28,)),
            Text(languageModel.title!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontWeight: FontWeight.w600),)
          ],
        ),
        content: Text(AppLocale.skill_dialog_content.getString(context),textAlign: TextAlign.right, textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title),),

        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: red_bar
              ),
              onPressed: () {

                Navigator.pop(context);
                Provider.of<LanguageVM>(context,listen: false).DeleteLang(languageModel);
                }, child: Text(AppLocale.delete.getString(context),style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white) )),

          ElevatedButton(onPressed: () {
            Provider.of<LanguageVM>(context,listen: false).SelectLangModel(languageModel);
            Navigator.pop(context);
          }, child: Text(AppLocale.edit.getString(context),style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title))),
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        // Provider.of<SkillVM>(context,listen: false).SelectSkillModel(skillModell);
        ShodDialogItem(context);
      },
      child: Container(
        //height: 50,
        width: min(sl<ScreenSize>().width,450),
        //  color: Colors.green,
        margin: EdgeInsets.only(top: sl<ScreenSize>().height*0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((languageModel.percent!.toInt()*20).toString()+"%"!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontWeight: FontWeight.w600),),
                Text(languageModel.title!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontWeight: FontWeight.w600)),

              ],
            ),
            SizedBox(height: 7,),
            Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(

                      color: work_background,

                      borderRadius: BorderRadius.all(Radius.circular(inner_radius))
                  ),
                ),
                // the percentage
                Container(
                  height: 8,
                  margin: EdgeInsets.only(left: min(sl<ScreenSize>().width,450)*  _margin_percent),
                  decoration: BoxDecoration(
                      //color:  Provider.of<LanguageVM>(context,listen: false).getItemBackgroundColor(languageModel.id!),
                      color:  green_bar,
                      boxShadow: [
                        BoxShadow(
                          color: green_bar,
                       //   color: Provider.of<LanguageVM>(context,listen: false).getItemBackgroundColor(languageModel.id!).withOpacity(0.7),
                          blurRadius: 4,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 0,

                        )
                      ],
                      borderRadius: BorderRadius.only(topRight: Radius.circular(inner_radius),bottomRight: Radius.circular(inner_radius),
                          topLeft: Radius.circular(languageModel!.percent==5?inner_radius:0),
                          bottomLeft:  Radius.circular(languageModel!.percent==5?inner_radius:0)
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

    // return Container(
    //   margin: EdgeInsets.all(7),
    //   // color: Colors.green,
    //   child: InputChip(
    //     backgroundColor: work_background,
    //     elevation: 4,
    //     shape: const StadiumBorder(
    //       side: BorderSide(style: BorderStyle.none),
    //     ),
    //     deleteIcon: Icon(Icons.close,size: 18,),
    //     onDeleted: () {
    //       Provider.of<LanguageVM>(context,listen: false).DeleteLang(languageModel);
    //
    //     },
    //     label: Text("${languageModel.title}  - سطح  ${languageModel.percent} "),
    //     //  avatar: Icon(Icons.remove),
    //     onPressed: () {
    //       print(languageModel.title!);
    //       Provider.of<LanguageVM>(context,listen: false).SelectLangModel(languageModel);
    //
    //     },
    //
    //   ),
    // );
  }
}
