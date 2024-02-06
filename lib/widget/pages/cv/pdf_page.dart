import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'cv1/cv1.dart';
import 'cv2/cv2.dart';

class PdfPage extends StatelessWidget {

  UserModel? userModel;
  int? selected_template;

  PdfPage({this.userModel,required this.selected_template});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

        child: Column(
          children: [

            Expanded(
                child:  PdfPreview(
                  initialPageFormat: PdfPageFormat.a4,
                  useActions: true,
                  maxPageWidth: 700,
//build: (format) => generateResumeCV2(format,userModel:userModel! ),
                  build: (format) {
                    switch(selected_template){
                      case 1: return  generateResumeCV1(format,userModel:userModel! );
                      case 2: return  generateResumeCV2(format,userModel:userModel! );
                      default: return generateResumeCV1(format, userModel: userModel!);
                    }
                  },
                  //  build: (format) => generateResume(format,profile_image_path: value.img_byte),
                )
            )
          ],
        ),
      ),
    );
  }
}
