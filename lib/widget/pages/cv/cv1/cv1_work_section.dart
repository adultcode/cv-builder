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
import '../../../custom_widgets/cv_1/widget.dart';

class Cv1WorkPart extends pw.StatelessWidget {

  UserModel? userModel;



  List<Experience>? work_list = [];

  Cv1WorkPart({this.userModel}){
    work_list = userModel!.works!.workModels?.map((e) {

      return Experience(experienceModel: e,top_margin: e?.id==1?null:top_margin_body_1*1.3);
    },).toList();

  }


  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        children: [
        TitleText('تجربه کاری',margin_top: top_margin_title_1),
          pw.SizedBox(height: 10),
          ...work_list!

        ]
    );
  }
}

