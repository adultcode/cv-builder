


import 'dart:math';
import 'dart:typed_data';

import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/model/social_model.dart';
import 'package:cv_builder/resume/cv_1/skill.dart';
import 'package:cv_builder/resume/cv_1/social.dart';
import 'package:cv_builder/resume/cv_1/widget.dart';
import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../util/constant/text_style.dart';
Future<String> Geticon(SocialModel socialModel)async{
  switch(socialModel?.socialType){
    case SocialType.linkedin:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.github:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.telegram:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.dribble:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
  // case SocialType.other:
  //   await rootBundle.loadString('assets/linkedin_fill.svg');
  //   break;
    default:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
  }
}
Future<Uint8List> generateResume(PdfPageFormat format,BuildContext buildContext) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');
  final fontData = await rootBundle.load('font/iran_light.ttf');
  final font_light = pw.Font.ttf(fontData);
  SocialModel socialModel = SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.linkedin);
  socialModel.icon_path = await Geticon(socialModel);

  final bgShape = await rootBundle.loadString('assets/linkedin_fill.svg');
 // final bgShape2 = await rootBundle.loadString('assets/linkedin_outline.svg');
  // final profileImage = pw.MemoryImage(
  //   (await rootBundle.load('assets/profile.jpg')).buffer.asUint8List(),
  // );

  final pageTheme = await _myPageTheme(format);
  doc.addPage(

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
                 crossAxisAlignment: pw.CrossAxisAlignment.end,
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
                     pw.SizedBox(height: 5),
                     pw.Container(
                       margin: pw.EdgeInsets.only(top: 10),
                       child: Skill(skillModel: SkillModel(title: 'Flutter',percent: 0.4))
                     ),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: 10),
                         child: Skill(skillModel: SkillModel(title: 'Java',percent: 0.8))
                     ),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: 10),
                         child: Skill(skillModel: SkillModel(title: 'Git',percent: 0.7))
                     ),

                    /*
                     language section
                      */
                     TitleText('زبان'),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: 10),
                         child: Skill(skillModel: SkillModel(title: 'English',percent: 0.7))
                     ),
                     /*
                     social section
                      */
                     TitleText('اجتماعی'),
                     pw.Container(
                         margin: pw.EdgeInsets.only(top: 10),
                         width: 22,
                         height: 22,
                         alignment: pw.Alignment.center,
                         padding: pw.EdgeInsets.all(4),
                         decoration: pw.BoxDecoration(
                           shape: pw.BoxShape.circle,
                           color: black_text1
                         ),
                       child: pw.SvgImage(svg: bgShape,height: 18,width: 18,colorFilter:bg_color1 )
                     ),
                     Social(socialModel: socialModel)
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
                  width: 1.0,
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