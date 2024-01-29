import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../../util/constant/font_size.dart';
import '../../../custom_widgets/cv_1/education.dart';
import '../../../custom_widgets/cv_1/experience.dart';
import '../../../custom_widgets/cv_1/language1.dart';
import '../../../custom_widgets/cv_1/skill.dart';
import '../../../custom_widgets/cv_1/widget.dart';

class Cv1SkillPart extends pw.StatelessWidget {

  UserModel? userModel;



  List<pw.Widget>? skill_list = [];

  Cv1SkillPart({this.userModel}){
    skill_list = userModel!.skills!.skill_list?.map((e) {
      return pw.Container(
          margin: pw.EdgeInsets.only(top: 10),
          child: Skill(skillModel:e,)
      );
    },).toList();

  }


  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        children: [
          TitleText('مهارت ها'),
          pw.SizedBox(height: 3),
          ...skill_list!

        ]
    );
  }
}

