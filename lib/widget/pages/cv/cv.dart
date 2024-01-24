


import 'dart:math';
import 'dart:typed_data';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import '../../../mvvm/model/entity/education_model/education_model.dart';
import '../../../mvvm/model/entity/social_model/social_model.dart';
import '../../../util/constant/color.dart';
import '../../../util/constant/font_size.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../../../util/constant/text_style.dart';
import '../../custom_widgets/cv_1/education.dart';
import '../../custom_widgets/cv_1/experience.dart';
import '../../custom_widgets/cv_1/profile_1.dart';
import '../../custom_widgets/cv_1/skill.dart';
import '../../custom_widgets/cv_1/social.dart';
import '../../custom_widgets/cv_1/widget.dart';

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
  case SocialType.instagram:
  return  await rootBundle.loadString('assets/linkedin_fill.svg');
    break;
    default:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
  }
}

List<Social>? socials =  [];

// Future<List<Social>?> GetSocialList(List<SocialModel?> social_models)async{
//
//   if(social_models!=null)
//
//  social_models =  social_models!.map((e)async {
//
//     e?.icon_path = await  Geticon(e!);
//   },).cast<SocialModel?>().toList();
//
//   socials = await social_models?.map((e) => Social(socialModel: e)).toList();
//   return socials;
// }

Future<Uint8List> generateResume(PdfPageFormat format, {Uint8List? profile_image_path, required UserModel userModel}) async {


  final doc = pw.Document(title: 'رزومه', author: 'حسام رسولیان');
  final fontData = await rootBundle.load('font/iran_light.ttf');
  final font_light = pw.Font.ttf(fontData);


 // List<Social>? socials2=[] ;
 // List<Social>?  socials2 = await  GetSocialList(userModel.socials!) ;

 // List<Social>? socials2 = [];
  print("Social size: ${userModel.socials?.length}");

  if(socials?.isEmpty==true){
  //  print("Not empty!!!");
    userModel.socials?.forEach((element) async{
      print("Get icon");
      element?.icon_path = await Geticon(element!);
      socials?.add(Social(socialModel: element));
      print("Social size: ${socials?.length}");

    });
  }




 //print("social1: ${socials[0].socialModel!.address}");
  var ex1 = WorkModel(title: 'برنامه نویس',end_date: 'هم اکنون',start_date: '1401/01',description: dump_body,
  company: 'گوگل');
  var ed1 = EducationModel(title: 'کارشناسی مهندسی کامپیوتر',end_date: '1402/09',start_date: '1401/01',description: dump_body,
      university: 'دانشگاه استنفورد');
  final bgShape = await rootBundle.loadString('assets/linkedin_fill.svg');
 // final bgShape2 = await rootBundle.loadString('assets/linkedin_outline.svg');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/me.png')).buffer.asUint8List(),
  );

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
               padding: pw.EdgeInsets.only(right: PdfPageFormat.cm*0.4,left: PdfPageFormat.cm*0.4),
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
                     if(userModel.socials!=null)
                     TitleText('اجتماعی'),
                     if(userModel.socials!=null)
                     ...?socials,



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

                         Profile1(
                             infoModel: userModel.infoModel!,
                             profile_img: profile_image_path!=null?pw.MemoryImage(profile_image_path!):profileImage),

                         /*
                         experience
                          */
                         TitleText('تجربه کاری',margin_top: top_margin_title_1),
                      //   TitleText(dump_body,margin_top: 20),
                         pw.SizedBox(height: 10),
                         Experience(experienceModel: ex1,),
                         Experience(experienceModel: ex1,top_margin: top_margin_experience_1),

                         /*
                         Education
                          */
                         TitleText('تحصیلات',margin_top: top_margin_title_1),
                         pw.SizedBox(height: 10),
                         Education1(education:ed1)


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