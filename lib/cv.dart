


import 'dart:math';
import 'dart:typed_data';

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
  format = format.copyWith(
      marginBottom: 0.0,
      marginLeft: 1.0*PdfPageFormat.inch ,
      marginRight: 2.0*PdfPageFormat.inch,
      marginTop: 0.0 );
  doc.addPage(
    // pw.Text('حسام رسولیانث',
    //     //  textScaleFactor: 1,
    //     style: pw.TextStyle(fontSize: 15),
    //     textDirection: pw.TextDirection.rtl
    // )
    pw.MultiPage(
     pageTheme: pageTheme,
     // pageFormat: format,
      build: (pw.Context context) => [
        pw.Container(
          alignment: pw.Alignment.topRight,
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Expanded(
                flex: 10,
                child:  pw.Container(
               //   width: 10*PdfPageFormat.cm,
                  height: 100,

                  color: PdfColor.fromInt(0xff9ce5d0)
              ),
              ),
              pw.Expanded(
                  flex: 18,

                  child: pw.Container(
                  // width: 3.0*PdfPageFormat.cm,
                    height: 100,
                    color: PdfColor.fromInt(0xff9005d0)
                )
              )
            ]
          ),
        ),
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
      marginLeft: 1.0*PdfPageFormat.cm ,
      marginRight: 1.0*PdfPageFormat.cm,
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
            // pw.Positioned(
            //   child: pw.SvgImage(svg: bgShape),
            //   left: 0,
            //   top: 0,
            // ),
            // pw.Positioned(
            //   child: pw.Transform.rotate(
            //       angle: pi, child: pw.SvgImage(svg: bgShape)),
            //   right: 0,
            //   bottom: 0,
            // ),
          ],
        ),
      );
    },
  );
}