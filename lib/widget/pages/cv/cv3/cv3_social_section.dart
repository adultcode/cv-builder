import 'dart:math';

import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:cv_builder/provider/icon_provider.dart';
import 'package:cv_builder/util/constant/radius_size.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

import '../../../../util/constant/color.dart';
import '../../../../util/constant/font_size.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv_1/education.dart';
import '../../../custom_widgets/cv_1/widget.dart';

class CV3SocialPart extends pw.StatelessWidget {

  UserModel? userModel;

  pw.MemoryImage? profile_img;



  CV3SocialPart({this.userModel,this.profile_img}){


  }


  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      color: cv3_container_color,
        height: 100,
        child:     pw.Row(
            children: [


            ]
        )
    );
  }
}

