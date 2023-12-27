import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/model/social_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../util/constant/color.dart';
import '../../util/constant/font_size.dart';
import '../../util/constant/text_style.dart';
import '../../util/social_icon.dart';

class Social extends pw.StatelessWidget {

  SocialModel? socialModel;
  var icon_path = '';

  Social({this.socialModel});


  @override
  pw.Widget build(pw.Context context) {
    return  pw.Container(
        width: double.infinity,
         //color: PdfColor.fromHex('#a61010'),
        margin: pw.EdgeInsets.only(top: 10),
        child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [


              pw.Expanded(child: pw.Container(
                alignment: pw.Alignment.topRight,
                padding: pw.EdgeInsets.only(right: 4),
                child: pw.Text(socialModel!.address!,
                    style: social_style_1)
              )),

              pw.Container(
                  width: 20,
                  height: 20,

                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.all(4),
                  decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      color: black_text1
                  ),
                  child: pw.SvgImage(svg: socialModel!.icon_path!,height: 18,width: 18,colorFilter:bg_color1 )
              ),

            ]
        )
    );
  }
}

Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () {
    return Future.value("I am data");
    // throw Exception("Custom Error");
  });
}