import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../mvvm/model/entity/work_model/work_model.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import '../../../util/constant/text_style.dart';

class Experience2 extends pw.StatelessWidget {

  WorkModel? experienceModel;
  double? top_margin;



  Experience2({this.experienceModel});


  @override
  pw.Widget build(pw.Context context) {
    return   pw.Container(
            width: double.infinity,
            // color: PdfColor.fromHex('#a61010'),
            //height: 100,

            padding: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.6,right: 7),
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [

                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("${experienceModel!.start_date!} - ${experienceModel!.end_date!}",
                            textDirection: pw.TextDirection.rtl,
                            style:cv2_body1),

                        pw.Text(experienceModel!.title!,
                            textDirection: pw.TextDirection.rtl,
                            style:cv2_body2)
                      ]
                    ),
                  pw.SizedBox(height: PdfPageFormat.cm*0.15),
                  pw.Text(experienceModel!.company!,
                      textDirection: pw.TextDirection.rtl,
                      style:cv2_head3),
                  pw.SizedBox(height: PdfPageFormat.cm*0.15),
                  pw.Text(experienceModel!.description!,
                      textDirection: pw.TextDirection.rtl,
                      style:cv2_body1)
                  ]
            )

    );
  }
}

