import 'dart:math';

import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/font_size.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../mvvm/model/entity/user_model.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv2/cv2_education_item.dart';
import '../../../custom_widgets/cv2/cv2_work_item.dart';


class CV2EducationPart extends pw.StatelessWidget {



  UserModel? userModel;
  List<Education2>? education_list = [];

  CV2EducationPart({this.userModel}){
    education_list = userModel!.educations!.educationList?.map((e) {

      return Education2(educationModel: e,);
    },).toList();
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
                        child: pw.Text("تحصیلات",style: cv2_head1, textDirection: pw.TextDirection.rtl)
                    )
                  ]
              ),
              ...?education_list
            ]
        )
    )
    ;
  }
}

