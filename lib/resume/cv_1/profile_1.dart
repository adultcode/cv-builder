import 'dart:math';

import 'package:cv_builder/model/experience_model.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../util/constant/color.dart';
import '../../util/constant/font_size.dart';
import '../../util/constant/text_style.dart';

class Profile1 extends pw.StatelessWidget {

  /// ExperienceModel? experienceModel;
  // double? top_margin;
  // var icon_path = '';

  pw.MemoryImage? profile_img;

  Profile1({this.profile_img});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Flexible(
        child:  pw.Container(
            width: double.infinity,
            margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*1.4),
            child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
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
                      child: pw.Text('حسام رسولیان',
                        textDirection: pw.TextDirection.rtl,
                      style: title_style_1)
                    ),
                    /*
                    job
                     */
                    pw.Container(
                      margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.3),
                        child: pw.Text('برنامه نویس موبایل',
                            textDirection: pw.TextDirection.rtl,
                            style: body_style_1)
                    ),
                    /*
                    city
                     */
                    pw.Container(
                        margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.1),
                        child: pw.Text('تهران - ایران',
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
                      width: PdfPageFormat.cm*1.7,
                    height: PdfPageFormat.cm*1.7,
                  //  child: pw.Image(profile_img!),
                    decoration: pw.BoxDecoration(
                      image: pw.DecorationImage(
                      //  image: pw.MemoryImage('profile_image_path')!
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

