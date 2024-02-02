import 'dart:math';

import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/font_size.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../mvvm/model/entity/user_model.dart';
import '../../../../util/constant/text_style.dart';


class CV2BioPart extends pw.StatelessWidget {



  UserModel? userModel;
  CV2BioPart({this.userModel});
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
                      width: PdfPageFormat.cm*16,
                      color: cv2_primary
                    ),
                    pw.SizedBox(width: PdfPageFormat.cm),
                    pw.Text("درباره من",style: section_title_style_2, textDirection: pw.TextDirection.rtl)
                  ]
                ),
                pw.SizedBox(height: PdfPageFormat.cm*0.3),
                pw.Text(userModel?.infoModel?.bio??'',style: body_grey_style_2, textDirection: pw.TextDirection.rtl)
              ]
            )
        )
    ;
  }
}

