import 'dart:math';

import 'package:cv_builder/util/constant/color.dart';
import 'package:cv_builder/util/constant/font_size.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../mvvm/model/entity/user_model.dart';
import '../../../../util/constant/text_style.dart';
import '../../../custom_widgets/cv2/cv2_language_item.dart';
import '../../../custom_widgets/cv2/cv2_work_item.dart';


class CV2LanguagePart extends pw.StatelessWidget {



  UserModel? userModel;
  List<Language2>? lang_list = [];

  CV2LanguagePart({this.userModel}){
    lang_list = userModel!.languageList!.lang_list?.map((e) {

      return Language2(languageModel: e,);
    },).toList();
  }
  //Profile1({this.profile_img,required this.infoModel});

  @override
  pw.Widget build(pw.Context context) {
    return   pw.Container(
        width: double.infinity,
        //  margin: pw.EdgeInsets.only(top: PdfPageFormat.cm*1.0),
        child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              // title
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Container(
                        height: 1,
                        width: divider_2,
                        color: cv2_primary

                    ),
                    pw.SizedBox(width: PdfPageFormat.cm),
                    pw.Expanded(
                        child: pw.Text("زبان",style: cv2_head1, textDirection: pw.TextDirection.rtl)
                    )
                  ]
              ),
              ...?lang_list
            ]
        )
    )
    ;
  }
}

