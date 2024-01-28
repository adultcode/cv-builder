import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../../util/constant/font_size.dart';
import '../../../custom_widgets/cv_1/education.dart';
import '../../../custom_widgets/cv_1/widget.dart';

class Cv1EducationPart extends pw.StatelessWidget {

  UserModel? userModel;



List<Education1>? education_list = [];

  Cv1EducationPart({this.userModel}){
    education_list = userModel!.educations!.educationList?.map((e) {
      return Education1(education: e,top_margin: e?.id==1?0:10);
    },).toList();

  }


  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        TitleText('تحصیلات',margin_top: top_margin_title_1),
        pw.SizedBox(height: 10),
        ...education_list!

      ]
    );
  }
}

