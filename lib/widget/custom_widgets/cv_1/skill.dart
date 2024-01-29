import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import '../../../util/constant/text_style.dart';

class Skill extends pw.StatelessWidget {

  SkillModel? skillModel;

  Skill({this.skillModel});

  @override
  pw.Widget build(pw.Context context) {
    return  pw.Container(
      width: double.infinity,
     // color: PdfColor.fromHex('#a61010'),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [

          pw.Text(skillModel!.title!,
              textDirection: pw.TextDirection.rtl,

              style: body_style_1),
          pw.Padding(
            padding: pw.EdgeInsets.only(left: PdfPageFormat.cm,top: top_margin_body_1),
            child: pw.Stack(
              alignment: pw.Alignment.topRight,
                children: [
                  pw.Container(
                    height: 2,
                    width: PdfPageFormat.cm*6,

                    color: black_text1,
                  ),
                  pw.Container(
                    height: 2,
                    width: (PdfPageFormat.cm*6)*skillModel!.percent!,
                    color: black_title1,
                  ),
                ]
            )
          )
        ]
      )
    );
  }
}
