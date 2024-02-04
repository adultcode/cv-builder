import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../mvvm/model/entity/work_model/work_model.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import '../../../util/constant/text_style.dart';

class Language2 extends pw.StatelessWidget {

  LanguageModel? languageModel;



  Language2({this.languageModel});


  @override
  pw.Widget build(pw.Context context) {
    return    pw.Container(
      width: double.infinity,
      padding: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.4,right: 7),
      child:

      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [

            // row 2
            pw.Expanded(
                child: pw.Row(
                  //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [

                      // percent
                      pw.Stack(
                          alignment: pw.Alignment.topRight,
                          children: [
                            pw.Container(
                              //height: 2,
                              width: PdfPageFormat.cm*5.5,

                            //  color: black_text1,
                            ),
                            pw.Container(),
                          ]
                      ),

                    //  pw.SizedBox(width: PdfPageFormat.cm*0.5),
                      // skill title
                      pw.Expanded(
                          child: pw.Container()
                      ),


                    ]
                )
            ),

            pw.SizedBox(width: 40),
            // row 1
            pw.Expanded(
                child: pw.Row(
                  //    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      // percent

                      pw.Stack(
                          alignment: pw.Alignment.topRight,
                          children: [
                            pw.Container(
                              height: 2,
                              width: PdfPageFormat.cm*5.5,

                              color: black_text1,
                            ),
                            pw.Container(
                              height: 2,
                              width: (PdfPageFormat.cm*5.5)*(languageModel!.percent!*0.2),
                              color: cv2_primary,
                            ),
                          ]
                      ),
                     //   pw.SizedBox(width: PdfPageFormat.cm*0.5),
                      // skill title
                      pw.Expanded(
                          child: pw.Text("${languageModel!.title!} ",
                              textDirection: pw.TextDirection.rtl,
                              style:cv2_body2)
                      ),
                    ]
                )
            ),

          ]
      ),



    );
  }
}

