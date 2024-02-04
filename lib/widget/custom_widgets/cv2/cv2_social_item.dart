import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/social_model/social_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../mvvm/model/entity/work_model/work_model.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import '../../../util/constant/text_style.dart';

class Social2 extends pw.StatelessWidget {

  SocialModel? social1;
  SocialModel? social2;



  Social2({this.social1,this.social2});


  @override
  pw.Widget build(pw.Context context) {
    return   pw.Container(
      width: double.infinity,
      // color: PdfColor.fromHex('#a61010'),
      //  height: 100,

      padding: pw.EdgeInsets.only(top: PdfPageFormat.cm*0.4,right: 7),
      child:

      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [

            // row 2
            pw.Expanded(
                child: social2!=null?pw.Row(
                  //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [

                      // social Address
                      pw.Expanded(
                          child: pw.Text("${social2!.address!} ",
                              textDirection: pw.TextDirection.rtl,
                              style:cv2_body2)
                      ),
                      pw.SizedBox(width: 4),

                      // social icon
                      pw.Container(
                          width: 20,
                          height: 20,

                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(4),
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              color: cv2_primary
                          ),
                          child: pw.SvgImage(svg: social2!.icon_path!,height: 18,width: 18,colorFilter:white_pdf )
                      ),


                    ]
                ):pw.Container()
            ),

            pw.SizedBox(width: 40),
            // row 1
            pw.Expanded(
                child: pw.Row(

                    children: [

                      // skill title
                      pw.Expanded(
                          child: pw.Text("${social1!.address!} ",
                              textDirection: pw.TextDirection.rtl,
                              style:cv2_body2)
                      ),
                      pw.SizedBox(width: 4),
                      // social icon
                      pw.Container(
                          width: 20,
                          height: 20,

                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(4),
                          decoration: pw.BoxDecoration(
                              shape: pw.BoxShape.circle,
                              color: cv2_primary
                          ),
                          child: pw.SvgImage(svg: social1!.icon_path!,height: 18,width: 18,colorFilter:white_pdf )
                      ),
                    ]
                )
            ),

          ]
      ),



    );
  }
}

