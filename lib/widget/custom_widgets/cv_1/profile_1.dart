import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../main.dart';
import '../../../mvvm/model/entity/info_model/info_model.dart';
import '../../../mvvm/model/entity/user_model.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import '../../../util/constant/text_style.dart';

class Profile1 extends pw.StatelessWidget {

  /// ExperienceModel? experienceModel;
  // double? top_margin;
  // var icon_path = '';

  pw.MemoryImage? profile_img;
  //InfoModel? infoModel;

  UserModel? userModel;
  Profile1({this.userModel,this.profile_img});
  //Profile1({this.profile_img,required this.infoModel});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Flexible(
        child:  pw.Container(
            width: double.infinity,
            margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*1.0),
            child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [

                  /*
                  name and bio
                   */
              pw.Container(
                margin: pw.EdgeInsets.only(right:PdfPageFormat.cm*0.7 ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [

                    /*
                    name
                     */
                    pw.Container(
                      child: pw.Text(userModel?.infoModel?.name??"بدون نام",
                        textDirection: pw.TextDirection.rtl,
                      style: title_style_1)
                    ),
                    /*
                    job
                     */
                    pw.Container(
                      margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.3),
                        child: pw.Text(userModel?.infoModel?.job??'',
                            textDirection: pw.TextDirection.rtl,
                            style: body_style_1)
                    ),
                    /*
                    city
                     */
                    pw.Container(
                        margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.1),
                        child: pw.Text(userModel?.infoModel?.city??'',
                            textDirection: pw.TextDirection.rtl,
                            style: body_style_1)
                    ),

                  ]
                )
              ),

                  /*
                  profile avataer
                   */


                  pw.Container(
                      width: PdfPageFormat.cm*1.9,
                    height: PdfPageFormat.cm*1.9,

                    decoration: pw.BoxDecoration(
                      image: pw.DecorationImage(
                        image: profile_img!
                      ),
                      border: pw.Border.all(
                        width: 1,
                        color: vertical_div_1
                      ),
                      shape: pw.BoxShape.circle,
                    )
                  ),

                ]
            )
        )
    );
  }
}

