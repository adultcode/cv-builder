
import 'dart:convert';


import 'package:path_provider/path_provider.dart';
// import 'dart:html' as html;
//  import 'dart:html' as html if (kIsWeb) 'dart:html';
//  import 'dart:html' as html
//  if(dart.library.html) "dart:html";


import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/foundation.dart' show Platform;
// import 'dart:html' if (dart.library.html) 'dart:html' as html ;
// import 'dart:html' if (dart.library.html) 'dart:io' as html;
import 'package:universal_html/html.dart' as html;
// import 'dart:io'
//  if (dart.library.html) 'dart:html' as html;
//  //as html;

 import 'package:url_launcher/url_launcher.dart' as ul;

import '../model/entity/user_model.dart';
class WebPdf{

  Future<bool> DownloadCVWeb(List<int> fileInts) async {
    try{

      if(kIsWeb ){

        html.AnchorElement(
            href: "data:application/octet-stream;charset=utf-16le;base64,${base64
                .encode(fileInts)}")
          ..setAttribute("download", "${DateTime
              .now()
              .millisecondsSinceEpoch}.pdf")
          ..click();
      }

      return true;
    }catch(e){
      print("***** Error: ${e.toString()}");
      return false;
    }


  }
}
// import 'dart:html' as html; // Import only when needed
//
// String filename = 'my_document.pdf'; // Replace with your desired filename
// String dataUri = 'data:application/pdf-stream;charset=utf-16le;base64,${base64
//          .encode(fileInts)}';
// Uri uri = Uri.parse(dataUri);
// ul.launchUrl(uri);

// Add filename suggestion to the URI
//  uri = uri.replace(queryParameters: {'filename': filename});
//   await ul.launchUrl(uri);
//    ul.launchUrl(
//      Uri.parse(
//        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}',
//      ).replace(queryParameters: {'filename': filename}),
//    );
//
//    final bytes = fileInts;
//
//    // Prepare file path
//    String path = "";
//     path = "C:/";
//
//   // final directory = await getDownloadsDirectory();
//    final file = File('$path/$filename');
//
//    // Create file and write bytes
//    if (await file.exists()) {
//      print('File already exists, overwriting: $filename');
//    }
//    await file.writeAsBytes(bytes);

// Open the downloaded file
// await OpenFile.open(file.path);


// ul.launchUrl(
//   Uri.parse(
//     'https://${file.path}',
//   ),
// );