


import 'dart:math';
import 'dart:typed_data';

import 'package:cv_builder/util/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generateResume(PdfPageFormat format,BuildContext buildContext) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');

  // final fontData = await rootBundle.load('iran.ttf');
  // final font = pw.Font.ttf(fontData);

  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  // format = format.copyWith(
  //     marginBottom: 0.0,
  //     marginLeft: 1.0*PdfPageFormat.inch ,
  //     marginRight: 2.0*PdfPageFormat.inch,
  //     marginTop: 0.0 );
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
           pw.Partition(
             flex: 18,

             child: pw.Column(
               crossAxisAlignment: pw.CrossAxisAlignment.start,
               children: [
                 pw.Container(
                   //width: 4.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                   color: PdfColor.fromInt(0xff9005d0),
                 ),
                 pw.Container(
                   //width: 3.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                   color: PdfColor.fromInt(0xff9005d0),
                 ),
                 pw.Container(
                   width: 3.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                   color: PdfColor.fromInt(0xff9005d0),
                 ),
                 pw.Container(
                   width: 3.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                   color: PdfColor.fromInt(0xff9005d0),
                 ),
                 pw.Container(
                   width: 3.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10,right: 4),
                   color: PdfColor.fromInt(0xff9005d0),
                 ),
               ]
             )
           ),


           pw.Partition(
             flex: 9,
             //width: 120,
             child:  pw.Column(
               children: [
                 pw.Container(
                 //  width: 1.0*PdfPageFormat.cm,
                   height: 200,
                   margin: pw.EdgeInsets.only(top: 10),
                   color: black_title1,
                 ),
               ]
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
  final font = pw.Font.ttf(fontData);

  format = format.copyWith(
      marginBottom: 0.0,
      marginLeft: 0.0*PdfPageFormat.cm ,
      marginRight: 0.0*PdfPageFormat.cm,
      marginTop: 0.0 );


  return pw.PageTheme(
    pageFormat: format,

    theme: pw.ThemeData.withFont(

      base: font,
      bold: await PdfGoogleFonts.openSansBold(),
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
                  color:  PdfColor.fromHex('#ec1c24'),
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