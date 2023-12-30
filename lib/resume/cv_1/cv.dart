


import 'dart:math';
import 'dart:typed_data';
import 'package:cv_builder/model/experience_model.dart';
import 'package:cv_builder/model/skill_model.dart';
import 'package:cv_builder/model/social_model.dart';
import 'package:cv_builder/resume/cv_1/experience.dart';
import 'package:cv_builder/resume/cv_1/profile_1.dart';
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
import 'package:http/http.dart' as http;

import '../../util/constant/text_style.dart';
Future<String> Geticon(SocialModel socialModel)async{
  switch(socialModel?.socialType){
    case SocialType.linkedin:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.github:
      return await rootBundle.loadString('assets/github_fill.svg');
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


Future<Uint8List> generateResume(PdfPageFormat format, {Image? profile_image_path}) async {
  final doc = pw.Document(title: 'My Résumé', author: 'David PHAM-VAN');
  final fontData = await rootBundle.load('font/iran_light.ttf');
  final font_light = pw.Font.ttf(fontData);

  SocialModel socialModel = SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.linkedin);
  SocialModel socialModel2 = SocialModel(address: 'lidsdsdssdson/user/hesam',socialType: SocialType.github);
  socialModel.icon_path = await Geticon(socialModel);
  socialModel2.icon_path = await Geticon(socialModel2);


  var ex1 = ExperienceModel(title: 'برنامه نویس',end_date: 'هم اکنون',start_date: '1401/01',description: dump_body,
  company: 'گوگل');

  final bgShape = await rootBundle.loadString('assets/linkedin_fill.svg');
 // final bgShape2 = await rootBundle.loadString('assets/linkedin_outline.svg');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/me.png')).buffer.asUint8List(),
  );

  var provider = await flutterImageProvider(NetworkImage(
      "https://s6.uupload.ir/files/407401421_744260147747117_9035329921598433128_n_mmpb.jpg"));
  // MemoryImage images = provider.buildImage(context);
  var response = await http.get(Uri.parse('https://s6.uupload.ir/files/407401421_744260147747117_9035329921598433128_n_mmpb.jpg'));
  var data = response.bodyBytes;

  var img_test = NetworkImage(
      "https://s6.uupload.ir/files/407401421_744260147747117_9035329921598433128_n_mmpb.jpg");
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

                     Social(socialModel: socialModel),
                     Social(socialModel: socialModel2),
                     /*
                     other section
                      */
                     TitleText('سایر توضیحات'),
                     RightBody(dump_body),
                   ]
               )
             )

           ),
          /*
           right side
            */

           pw.Partition(
               flex: 18,

               child: pw.Padding(
                   padding: pw.EdgeInsets.only(right: PdfPageFormat.cm*0.7,left: PdfPageFormat.cm*0.4),

                   child: pw.Column(
                       crossAxisAlignment: pw.CrossAxisAlignment.start,
                       children: [
                         /*
                         image and name
                          */

                         Profile1(profile_img: data==null?pw.MemoryImage(data):profileImage),

                         /*
                         experience
                          */
                         TitleText('تجربه کاری',margin_top: 20),
                      //   TitleText(dump_body,margin_top: 20),
                         pw.SizedBox(height: 10),
                         Experience(experienceModel: ex1,),
                         Experience(experienceModel: ex1,top_margin: top_margin_experience_1),


                       ]
                   )
               )
           ),
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
              left: 0,
              child: pw.Container(
                  width: 1.0,
                  height: PdfPageFormat.a4.height,
                  color:  vertical_div_1,
                  margin: pw.EdgeInsets.only(left: 200)
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