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
  var icon_path = '';

  Experience({this.experienceModel});


  @override
  pw.Widget build(pw.Context context) {
    return pw.Flexible(
      child:  pw.Container(
          width: double.infinity,
          //color: PdfColor.fromHex('#a61010'),
          //height: 100,
          margin: pw.EdgeInsets.only(top: 10),
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [

                pw.Container(
                    width: 50
                ),

                pw.Expanded(child: pw.Container(

                    child: pw.Column(
                        children: [
                          /*
                          title
                           */
                           pw.Container(
                              alignment: pw.Alignment.topRight,
                              padding: pw.EdgeInsets.only(right: 4),
                              child: pw.Text(experienceModel!.title!,
                                  textDirection: pw.TextDirection.rtl,

                                  style: title_experience_1)
                          ),
                          /*
                          date
                           */
                          pw.Container(
                              alignment: pw.Alignment.topRight,
                              margin: pw.EdgeInsets.only(right: 4,top: PdfPageFormat.cm*0.3),
                              child: pw.Text("${experienceModel!.start_date} - ${experienceModel!.end_date}",
                                  textDirection: pw.TextDirection.rtl,

                                  style: date_experience_1)
                          ),
                          /*
                          description
                           */
                          pw.Container(
                              alignment: pw.Alignment.topRight,
                              margin: pw.EdgeInsets.only(right: 4,top: PdfPageFormat.cm*0.3),
                              child: pw.Text("${experienceModel!.description}",
                                  textDirection: pw.TextDirection.rtl,

                                  style: body_style_1)
                          )

                        ]
                    )
                ))



              ]
          )
      )
    );
  }
}

