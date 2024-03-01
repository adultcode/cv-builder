import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/viewmodel/skill_viewmodel.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:cv_builder/util/constant/string_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../../../../config/localize/languages.dart';
import '../../../../../config/locator.dart';
import '../../../../../util/constant/color.dart';
import '../../../../../util/constant/screen_size.dart';

class SkillItem extends StatelessWidget {

  SkillModel skillModell;

  double _margin_percent = 0;
  late Color _active_bar;
  SkillItem({required this.skillModell}){
    _margin_percent = 100 - skillModell.percent!;
    _margin_percent = _margin_percent/100;

    //switch(skillModell.percent.toInt())
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
            }, icon: Icon(Icons.cancel_outlined,size: 28,color: work_text)),
            Text(skillModell.title!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontWeight: FontWeight.w600),)
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
                Provider.of<SkillVM>(context,listen: false).DeleteSkill(skillModell);
          }, child: Text(AppLocale.delete.getString(context),style:Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white) )),

          ElevatedButton(onPressed: () {
            Provider.of<SkillVM>(context,listen: false).SelectSkillModel(skillModell);
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
                Text(skillModell.percent!.toInt().toString()+"%"!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primary_title,fontWeight: FontWeight.w600),),
                Text(skillModell.title!,
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
                      color:  Provider.of<SkillVM>(context,listen: false).getItemBackgroundColor(skillModell.id!),
                      boxShadow: [
                        BoxShadow(
                          color: Provider.of<SkillVM>(context,listen: false).getItemBackgroundColor(skillModell.id!).withOpacity(0.7),
                          blurRadius: 4,
                      blurStyle: BlurStyle.outer,
                          spreadRadius: 0,

                        )
                      ],
                      borderRadius: BorderRadius.only(topRight: Radius.circular(inner_radius),bottomRight: Radius.circular(inner_radius),
                      topLeft: Radius.circular(skillModell!.percent==100?inner_radius:0),
                      bottomLeft:  Radius.circular(skillModell!.percent==100?inner_radius:0)
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
    //  // color: Colors.green,
    //   child: InputChip(
    //     backgroundColor: work_background,
    //     elevation: 4,
    //     shape: const StadiumBorder(
    //       side: BorderSide(style: BorderStyle.none),
    //     ),
    //     deleteIcon: Icon(Icons.close,size: 18,),
    //     onDeleted: () {
    //       Provider.of<SkillVM>(context,listen: false).DeleteSkill(skillModell);
    //
    //     },
    //     label: Text("${skillModell.title} - ${skillModell.percent}"
    //     ,textDirection: TextDirection.rtl,),
    //   //  avatar: Icon(Icons.remove),
    //     onPressed: () {
    //       print(skillModell.title!);
    //       Provider.of<SkillVM>(context,listen: false).SelectSkillModel(skillModell);
    //
    //     },
    //
    //   ),
    // );
  }
}
