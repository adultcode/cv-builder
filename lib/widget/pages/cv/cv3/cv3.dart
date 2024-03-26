
import 'dart:math';
import 'dart:typed_data';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/work_model/work_model.dart';
import '../../../../mvvm/model/entity/education_model/education_model.dart';
import '../../../../mvvm/model/entity/social_model/social_model.dart';
import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv_1/education.dart';
import '../../../custom_widgets/cv_1/experience.dart';
import '../../../custom_widgets/cv_1/profile_1.dart';
import '../../../custom_widgets/cv_1/skill.dart';
import '../../../custom_widgets/cv_1/social.dart';
import '../../../custom_widgets/cv_1/widget.dart';
import '../cv1/cv1_education_section.dart';
import '../cv1/cv1_language_section.dart';
import '../cv1/cv1_skill_section.dart';
import '../cv1/cv1_work_section.dart';
import '../cv2/cv2_bio_section.dart';
import '../cv2/cv2_education_section.dart';
import '../cv2/cv2_job_section.dart';
import '../cv2/cv2_language_section.dart';
import '../cv2/cv2_profile_section.dart';
import '../cv2/cv2_skill_section.dart';
import '../cv2/cv2_social_section.dart';
import 'cv3_profile_section.dart';

Future<String> Geticon(SocialModel socialModel)async{
  switch(socialModel?.socialType){
    case SocialType.linkedin:
      return await rootBundle.loadString('assets/linkedin_fill.svg');
      break;
    case SocialType.github:
      return await rootBundle.loadString('assets/github_fill.svg');
      break;
    case SocialType.telegram:
      return await rootBundle.loadString('assets/telegram2.svg');
      break;
    case SocialType.dribble:
      return await rootBundle.loadString('assets/dribble.svg');
      break;
    case SocialType.instagram:
      return  await rootBundle.loadString('assets/instagram.svg');
      break;
    default:
      return await rootBundle.loadString('assets/website.svg');
      break;
  }
}

List<Social>? socials =  [];
Future<Uint8List> generateResumeCV3(PdfPageFormat format, {Uint8List? profile_image_path, required UserModel userModel}) async {


  final doc = pw.Document(title: 'رزومه', author: 'جاب یار');
  final fontData = await rootBundle.load('assets/font/iran_light.ttf');
  final font_light = pw.Font.ttf(fontData);



  //if(socials?.isEmpty==true ){
  if(socials?.isEmpty==true && userModel.socials!=null){
    //  print("Not empty!!!");
    List<SocialModel?>? updatedList = userModel.socials?.socialModels?.where((obj) => obj != null).toList();

    updatedList?.forEach((element) async{
      print("Get icon");
      if(element!=null){
        element?.icon_path = await Geticon(element!);
        socials?.add(Social(socialModel: element));
        print("Social size: ${socials?.length}");
      }
    });

    userModel.socials?.socialModels = updatedList;
  }




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
        pw.Container(
            padding: pw.EdgeInsets.all( PdfPageFormat.cm),
            child: pw.Column(
                mainAxisSize: pw.MainAxisSize.max,
                children: [

                  if(userModel.infoModel!=null && userModel.infoModel?.bio!=null)
                    CV3ProfilePart(userModel: userModel,
                        profile_img:  userModel.image_avatar!=null?pw.MemoryImage(userModel.image_avatar!):profileImage),

                  // bio
                  if(userModel.infoModel!=null && userModel.infoModel?.bio!=null)
                    pw.SizedBox(height: top_margin_title_2 ),
                  if(userModel.infoModel!=null && userModel.infoModel?.bio!=null)
                    CV2BioPart(userModel: userModel),

                  // work
                  if(userModel.works!=null && userModel.works?.workModels!=null)
                    pw.SizedBox(height:top_margin_title_2),
                  if(userModel.works!=null && userModel.works?.workModels!=null)
                    CV2WorkPart(userModel: userModel),

                  // education
                  if(userModel.educations!=null && userModel.educations?.educationList!=null)
                    pw.SizedBox(height: top_margin_title_2),
                  if(userModel.educations!=null && userModel.educations?.educationList!=null)
                    CV2EducationPart(userModel: userModel),

                  // skill
                  if(userModel.skills!=null && userModel.skills?.skill_list!=null)
                    pw.SizedBox(height: top_margin_title_2),
                  if(userModel.skills!=null && userModel.skills?.skill_list!=null)
                    CV2SkillPart(userModel: userModel),

                  // language
                  if(userModel.languageList!=null && userModel.languageList?.lang_list!=null)
                    pw.SizedBox(height: top_margin_title_2),
                  if(userModel.languageList!=null && userModel.languageList?.lang_list!=null)
                    CV2LanguagePart(userModel: userModel),
                  //social
                  if(userModel.socials!=null && userModel.socials?.socialModels!=null)
                    pw.SizedBox(height: top_margin_title_2),
                  if(userModel.socials!=null && userModel.socials?.socialModels!=null)
                    CV2SocialPart(userModel: userModel),


                ]
            )
        )

      ],
    ),
  );
  return doc.save();
}


Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');
  final fontData = await rootBundle.load('assets/font/iran.ttf');
  final fontData_bold = await rootBundle.load('assets/font/iran_bold.ttf');
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
                      color: cv2_bg,


                    )
                ),

              ]
          )

      );
    },
  );
}