import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv_1/education.dart';
import '../../../custom_widgets/cv_1/widget.dart';

class CV3ProfilePart extends pw.StatelessWidget {

  UserModel? userModel;

  pw.MemoryImage? profile_img;



  CV3ProfilePart({this.userModel,this.profile_img}){


  }


  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
        child:     pw.Row(
            children: [

              pw.Expanded(
                  child:

                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                     // mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                      children: [
                        //name
                        pw.Text(userModel!.infoModel!.name??"",textDirection: pw.TextDirection.rtl,
                            style: name_style_3),
                        pw.SizedBox(height: PdfPageFormat.cm*0.2),
                        //job
                        pw.Text(userModel!.infoModel!.job??"",textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.right,
                            style:body_style_3.copyWith(color: cv3_greytext) ),
                        pw.SizedBox(height: PdfPageFormat.cm*0.2),
                        pw.Text(userModel!.infoModel!.bio??"",textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.right,
                            style:body_style_3.copyWith(color: cv3_bodytext_color) ),


                      ]
                  )


              ),
              pw.SizedBox(width: PdfPageFormat.cm*0.5),

              pw.Container(
                  width: PdfPageFormat.cm*3.6,
                  height: PdfPageFormat.cm*3.8,

                  decoration: pw.BoxDecoration(
                      image: pw.DecorationImage(
                          image: profile_img!
                      ),
                      borderRadius: pw.BorderRadius.all(pw.Radius.circular(inner_radius))
                    // shape: pw.BoxShape.circle,
                  )
              ),

            ]
        )
    );
  }
}

