import 'dart:math';

import 'package:cv_builder/model/experience_model.dart';
import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/model/social_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../util/constant/color.dart';
import '../../util/constant/font_size.dart';
import '../../util/constant/text_style.dart';
import '../../util/social_icon.dart';

class Experience extends pw.StatelessWidget {

  ExperienceModel? experienceModel;
  double? top_margin;
  var icon_path = '';


  Experience({this.experienceModel,this.top_margin});


  @override
  pw.Widget build(pw.Context context) {
    return pw.Flexible(
      child:  pw.Container(
          width: double.infinity,
         // color: PdfColor.fromHex('#a61010'),
          //height: 100,
          decoration: pw.BoxDecoration(
            border: pw.Border(
              right: pw.BorderSide(
                color: vertical_div_1,
                width: 1

              )
            )
          ),
          padding: pw.EdgeInsets.only(top: top_margin??0,right: 7),
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [



                pw.Expanded(child: pw.Container(

                    child: pw.Column(
                        children: [
                          /*
                          title
                           */
                           pw.Container(
                              alignment: pw.Alignment.topRight,
                              padding: pw.EdgeInsets.only(right: 0),
                              child: pw.Text("${experienceModel!.title!} - ${experienceModel!.company!}",
                                  textDirection: pw.TextDirection.rtl,

                                  style: title_experience_1)
                          ),
                          /*
                          date
                           */
                          pw.Container(
                              alignment: pw.Alignment.topRight,
                              margin: pw.EdgeInsets.only(top: top_margin_body_1),
                              child: pw.Text("${experienceModel!.start_date} - ${experienceModel!.end_date}",
                                  textDirection: pw.TextDirection.rtl,

                                  style: body_style_1)
                          ),

                          /*
                          description
                           */
                          pw.Container(
                              alignment: pw.Alignment.topRight,
                              margin: pw.EdgeInsets.only(top: top_margin_body_1),
                              child: pw.Text("${experienceModel!.description}",
                                  textDirection: pw.TextDirection.rtl,
                                  textAlign: pw.TextAlign.justify,
                                  style: body_style_1)
                          )

                        ]
                    )
                )),

                // pw.Container(
                //     width: 2,
                //   height: double.infinity,
                //  // height: 50,
                //   color: black_title1
                // ),



              ]
          )
      )
    );
  }
}

