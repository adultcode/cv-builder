


import 'dart:math';
import 'dart:typed_data';

import 'package:cv_builder/util/color.dart';
import 'package:cv_builder/util/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
                     pw.Container(
                         alignment: pw.Alignment.topRight,
                         margin: pw.EdgeInsets.only(top: 20),
                         child: pw.Text('پروفایل',
                             textDirection: pw.TextDirection.rtl,
                             style: pw.TextStyle(color: black_title1,fontWeight: pw.FontWeight.bold,fontSize: text_title_1)
                         )

                     ),
                     pw.Container(
                         alignment: pw.Alignment.topRight,
                       //  margin: pw.EdgeInsets.only(top: top_margin_body_1),
                         child: pw.Text(dump_body,
                             textDirection: pw.TextDirection.rtl,
                             textAlign: pw.TextAlign.justify,
                             style: pw.TextStyle(
                                 font: font_light,
                                 color: black_text1,fontSize: text_body_1)
                         )

                     ),

                     /*
                     contact section
                      */
                     pw.Container(
                         alignment: pw.Alignment.topRight,
                         margin: pw.EdgeInsets.only(top: top_margin_title_1),
                         child: pw.Text('اطلاعات تماس',
                             textDirection: pw.TextDirection.rtl,
                             style: pw.TextStyle(color: black_title1,fontWeight: pw.FontWeight.bold,fontSize: text_title_1)
                         )

                     ),
                     pw.Container(
                         alignment: pw.Alignment.topRight,
                         margin: pw.EdgeInsets.only(top: 15),
                         child: pw.Text(dump_body,
                             textDirection: pw.TextDirection.rtl,

                             style: pw.TextStyle(
                              //   font: font,
                                 color: black_text1,fontWeight: pw.FontWeight.normal,fontSize: text_body_1)
                         )

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
                  width: 1,
                  height: PdfPageFormat.a4.height,
                  color:  black_text1,
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