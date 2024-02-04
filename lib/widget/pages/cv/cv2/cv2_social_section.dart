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
import '../../../custom_widgets/cv2/cv2_social_item.dart';
import '../../../custom_widgets/cv2/cv2_work_item.dart';


class CV2SocialPart extends pw.StatelessWidget {



  UserModel? userModel;
  List<Social2>? social_list = [];

  CV2SocialPart({this.userModel}){
    // education_list = userModel!.skills!.skill_list?.map((e) {
    //
    //   return Skill2(skillModel1: e,);
    // },).toList();

    for(var i =0;i < userModel!.socials!.socialModels!.length; i+=2){
      //

      print("social i: $i ----------");
      social_list?.add(
          Social2(
            social1: i<userModel!.socials!.socialModels!.length==true?userModel!.socials!.socialModels![i]:null,
            social2: i+1<userModel!.socials!.socialModels!.length==true?userModel!.socials!.socialModels![i+1]:null,
          )
      );

    }
    userModel?.socials?.socialModels?.forEach((element) {
      print("social item: ${element?.address}");
    });

 //   print(social_list?[0]);
 //   print(social_list?[1]);
   // print(social_list?[2]);
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
                        width: divider_2,
                        color: cv2_primary

                    ),
                    pw.SizedBox(width: PdfPageFormat.cm),
                    pw.Expanded(
                        child: pw.Text("ارتباط",style: cv2_head1, textDirection: pw.TextDirection.rtl)
                    )
                  ]
              ),
              ...social_list!

            ]
        )
    )
    ;
  }
}

