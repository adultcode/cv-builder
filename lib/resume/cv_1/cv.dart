


import 'dart:math';
import 'dart:typed_data';

import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/resume/cv_1/skill.dart';
import 'package:cv_builder/resume/cv_1/widget.dart';
import 'package:cv_builder/util/color.dart';
import 'package:cv_builder/util/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../util/text_style.dart';

Future<Uint8List> generateResume(PdfPageFormat format,BuildContext buildContext) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');
  final fontData = await rootBundle.load('font/iran_light.ttf');
  final font_light = pw.Font.ttf(fontData);


  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  doc.addPage(
    // pw.Text('حسام رسولیانث',
    //     //  textScaleFactor: 1,
    //     style: pw.TextStyle(fontSize: 15),
    //     textDirection: pw.TextDirection.rtl
    // )
    pw.MultiPage(

     pageTheme: pageTheme,
     // pageFormat: format,,
      build: (pw.Context context) => [
       pw.Partitions(
         mainAxisSize: pw.MainAxisSize.max,
         children: [

           /*
           left side
            */
           pw.Partition(
             flex: 18,

             child: pw.Column(
               crossAxisAlignment: pw.CrossAxisAlignment.start,
               children: [
                 pw.Container(
                   //width: 4.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                //   color: PdfColor.fromInt(0xff9005d0),
                 ),


               ]
             )
           ),


           /*
           right side
            */
           pw.Partition(
             flex: 9,
             child:  pw.Padding(
               padding: pw.EdgeInsets.only(right: PdfPageFormat.cm*0.4,left: PdfPageFormat.cm*0.2),
               child: pw.Column(
                   children: [
                     /*
                     profile section
                      */
                     TitleText('پروفایل',margin_top: 20),

                     RightBody(dump_body,margin_top: 0),


                     /*
                     contact section
                      */
                     TitleText('اطلاعات تماس'),
                     RightBody('call@hesam.cc'),
                     RightBody('+989019655342'),
                     /*
                     skills section
                      */
                     TitleText('مهارت ها'),
                     pw.Container(
                       margin: pw.EdgeInsets.only(top: 15),
                       child: Skill(skillModel: SkillModel(title: 'Flutter',percent: 0.4))
                     ),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: top_margin_title_1),
                         child: Skill(skillModel: SkillModel(title: 'Java',percent: 0.8))
                     ),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: top_margin_title_1),
                         child: Skill(skillModel: SkillModel(title: 'Git',percent: 0.7))
                     ),


                   ]
               )
             )

           )
         ]
       )

      ],
    ),
  );
  return doc.save();
}


Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');
  final fontData = await rootBundle.load('font/iran.ttf');
  final fontData_bold = await rootBundle.load('font/iran_bold.ttf');
  final font = pw.Font.ttf(fontData);
  final font_bold = pw.Font.ttf(fontData_bold);

  format = format.copyWith(
      marginBottom: 0.0,
      marginLeft: 0.0*PdfPageFormat.cm ,
      marginRight: 0.0*PdfPageFormat.cm,
      marginTop: 0.0 );


  return pw.PageTheme(
    pageFormat: format,

    theme: pw.ThemeData.withFont(

      base: font,
      bold: font_bold,
      icons: await PdfGoogleFonts.materialIcons(),
    ),

    buildBackground: (pw.Context context) {
      return pw.FullPage(

        ignoreMargins: true,
        child: pw.Stack(
          children: [

            pw.Expanded(
                child: pw.Container(
                    color: bg_color1,


                )
            ),
            pw.Positioned(
              right: 0,
              child: pw.Container(
                  width: 2.0,
                  height: PdfPageFormat.a4.height,
                  color:  vertical_div_1,
                  margin: pw.EdgeInsets.only(right: 200)
              )
            ),
          ]
        )
        // child: pw.Stack(
        //   children: [
        //
        //     // pw.Positioned(
        //     //   child: pw.SvgImage(svg: bgShape),
        //     //   left: 0,
        //     //   top: 0,
        //     // ),
        //     // pw.Positioned(
        //     //   child: pw.Transform.rotate(
        //     //       angle: pi, child: pw.SvgImage(svg: bgShape)),
        //     //   right: 0,
        //     //   bottom: 0,
        //     // ),
        //   ],
        // ),
      );
    },
  );
}