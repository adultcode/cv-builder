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
                      children: [
                        //name
                        pw.Text(userModel!.infoModel!.name??"",textDirection: pw.TextDirection.rtl,
                            style: name_style_2),
                        pw.SizedBox(height: PdfPageFormat.cm*0.25),
                        //job
                        pw.Text(userModel!.infoModel!.job??"",textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.right,
                            style:name2_style_2 ),
                        pw.SizedBox(height: PdfPageFormat.cm*0.35),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,

                            children: [
                              pw.Expanded(

                                  child: pw.Container(
                                    //  color: cv2_primary,
                                      child: pw.Column(
                                          crossAxisAlignment: pw.CrossAxisAlignment.end,

                                          //mobile
                                          children: [

                                            // mobile
                                            pw.Row(
                                                mainAxisAlignment: pw.MainAxisAlignment.end,

                                                children: [
                                                  pw.Text(userModel?.infoModel?.mobile.toString()??""
                                                      ,textDirection: pw.TextDirection.rtl,
                                                      style:cv2_body1 ),
                                                  pw.Text("موبایل "
                                                      ,textDirection: pw.TextDirection.rtl,
                                                      style:cv2_body2 ),
                                                ]
                                            ),
                                            pw.SizedBox(height: PdfPageFormat.cm*0.2),
                                            // birth
                                            pw.Row(
                                                mainAxisAlignment: pw.MainAxisAlignment.end,

                                                children: [
                                                  pw.Text(userModel?.infoModel?.birth??""
                                                      ,textDirection: pw.TextDirection.rtl,
                                                      style:cv2_body1 ),
                                                  pw.Text("تولد "
                                                      ,textDirection: pw.TextDirection.rtl,
                                                      style:cv2_body2 ),
                                                ]
                                            )
                                          ])
                                  )
                              ),
                              pw.Expanded(
                                child: pw.Container(
                                  //    color: vertical_red,
                                    child:  pw.Column(
                                        crossAxisAlignment: pw.CrossAxisAlignment.end,

                                        children: [
                                          // email
                                          pw.Row(
                                              mainAxisAlignment: pw.MainAxisAlignment.end,

                                              children: [
                                                pw.Text(userModel?.infoModel?.email??""
                                                    ,textDirection: pw.TextDirection.rtl,
                                                    style:cv2_body1 ),
                                                pw.Text("ایمیل "
                                                    ,textDirection: pw.TextDirection.rtl,
                                                    style:cv2_body2 ),
                                              ]
                                          ),
                                          pw.SizedBox(height: PdfPageFormat.cm*0.2),
                                          // city
                                          pw.Row(
                                              mainAxisAlignment: pw.MainAxisAlignment.end,

                                              children: [
                                                pw.Text(userModel?.infoModel?.city??""
                                                    ,textDirection: pw.TextDirection.rtl,
                                                    style:cv2_body1 ),
                                                pw.Text("شهر "
                                                    ,textDirection: pw.TextDirection.rtl,
                                                    style:cv2_body2 ),
                                              ]
                                          ),
                                        ])
                                ),
                              ),

                            ]
                        )

                      ]
                  )


              ),

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

