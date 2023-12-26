//
//
//
// import 'dart:math';
// import 'dart:typed_data';
//
// import 'package:cv_builder/util/constant/color.dart';
// import 'package:cv_builder/util/constant/font_size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
//
// import '../../util/constant/text_style.dart';
//
// Future<Uint8List> generateResume(PdfPageFormat format,BuildContext buildContext) async {
//   final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');
//   final fontData = await rootBundle.load('font/iran_light.ttf');
//   final font_light = pw.Font.ttf(fontData);
//
//   final bgShape = await rootBundle.loadString('assets/linkedin_fill.svg');
//
//   final pageTheme = await _myPageTheme(format);
//   doc.addPage(
//
//     pw.MultiPage(
//
//       pageTheme: pageTheme,
//       // pageFormat: format,,
//       build: (pw.Context context) => [
//
//         Container(
//           child: Text("ssdsdsdsdsd"),
//         )
//
//       ],
//     ),
//   );
//   return doc.save();
// }
//
//
// Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
//   final bgShape = await rootBundle.loadString('assets/resume.svg');
//   final fontData = await rootBundle.load('font/iran.ttf');
//   final fontData_bold = await rootBundle.load('font/iran_bold.ttf');
//   final font = pw.Font.ttf(fontData);
//   final font_bold = pw.Font.ttf(fontData_bold);
//
//   format = format.copyWith(
//       marginBottom: 0.0,
//       marginLeft: 0.0*PdfPageFormat.cm ,
//       marginRight: 0.0*PdfPageFormat.cm,
//       marginTop: 0.0 );
//
//
//   return pw.PageTheme(
//     pageFormat: format,
//
//     theme: pw.ThemeData.withFont(
//
//       base: font,
//       bold: font_bold,
//       icons: await PdfGoogleFonts.materialIcons(),
//     ),
//
//     buildBackground: (pw.Context context) {
//       return pw.FullPage(
//
//           ignoreMargins: true,
//           child: pw.Stack(
//               children: [
//
//                 pw.Expanded(
//                     child: pw.Container(
//                       color: bg_color1,
//
//
//                     )
//                 ),
//                 pw.Positioned(
//                     right: 0,
//                     child: pw.Container(
//                         width: 1.0,
//                         height: PdfPageFormat.a4.height,
//                         color:  vertical_div_1,
//                         margin: pw.EdgeInsets.only(right: 200)
//                     )
//                 ),
//               ]
//           )
//         // child: pw.Stack(
//         //   children: [
//         //
//         //     // pw.Positioned(
//         //     //   child: pw.SvgImage(svg: bgShape),
//         //     //   left: 0,
//         //     //   top: 0,
//         //     // ),
//         //     // pw.Positioned(
//         //     //   child: pw.Transform.rotate(
//         //     //       angle: pi, child: pw.SvgImage(svg: bgShape)),
//         //     //   right: 0,
//         //     //   bottom: 0,
//         //     // ),
//         //   ],
//         // ),
//       );
//     },
//   );
// }