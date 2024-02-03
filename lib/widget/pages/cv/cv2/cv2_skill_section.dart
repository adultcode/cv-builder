import 'dart:math';

import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/font_size.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../mvvm/model/entity/user_model.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv2/cv2_education_item.dart';
import '../../../custom_widgets/cv2/cv2_skill_item.dart';
import '../../../custom_widgets/cv2/cv2_work_item.dart';


class CV2SkillPart extends pw.StatelessWidget {



  UserModel? userModel;
  List<Skill2>? education_list = [];

  CV2SkillPart({this.userModel}){
    // education_list = userModel!.skills!.skill_list?.map((e) {
    //
    //   return Skill2(skillModel1: e,);
    // },).toList();

    for(var i =0;i < userModel!.skills!.skill_list!.length; i+=2){
      //

      print("int i: $i ----------");
      education_list?.add(
        Skill2(
          skillModel1: i<userModel!.skills!.skill_list!.length==true?userModel!.skills!.skill_list![i]:null,
          skillModel2: i+1<userModel!.skills!.skill_list!.length==true?userModel!.skills!.skill_list![i+1]:null,
        )
      );
     // if(i>6)
     // break;

    }
  }
  //Profile1({this.profile_img,required this.infoModel});

  @override
  pw.Widget build(pw.Context context) {
    return   pw.Container(
        width: double.infinity,
        //  margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*1.0),
        child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              // title
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Container(
                        height: 1,
                        width: PdfPageFormat.cm*15,
                        color: cv2_primary

                    ),
                    pw.SizedBox(width: PdfPageFormat.cm),
                    pw.Expanded(
                        child: pw.Text("مهارت ها",style: cv2_head1, textDirection: pw.TextDirection.rtl)
                    )
                  ]
              ),
              ...education_list!
              // pw.Container(
              //   height: 11+0,
              //  child: pw.ListView.builder(
              //      itemCount: education_list!.length,
              //      itemBuilder: (context, index) {
              //        return education_list![index];
              //      },
              //      // children: [
              //      //   ...education_list!,
              //      //
              //      //
              //      // ]
              //  )
              // )
            ]
        )
    )
    ;
  }
}

