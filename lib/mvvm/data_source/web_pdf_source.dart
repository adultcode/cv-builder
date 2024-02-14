//  import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:io';
//  import 'package:flutter/foundation.dart' show kIsWeb;
//
// import '../model/entity/user_model.dart';
//
// class WebPdf{
//
//
//   static DownloadCVWeb(List<int> fileInts) async {
//     // PdfPageFormat format = PdfPageFormat();
//     // List<int> fileInts = await GetTemplate(userModel);
//     if(kIsWeb){
//       html.AnchorElement(
//           href: "data:application/octet-stream;charset=utf-16le;base64,${base64
//               .encode(fileInts)}")
//         ..setAttribute("download", "${DateTime
//             .now()
//             .millisecondsSinceEpoch}.pdf")
//         ..click();
//     }
//
//   }
// }
