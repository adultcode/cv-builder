import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'cv1/cv1.dart';

class PdfPage extends StatelessWidget {

  UserModel? userModel;

  PdfPage({this.userModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

        child: Column(
          children: [
            ElevatedButton(onPressed: () async{
             // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
              // context.read<IconProvider>()
//                Provider.of<IconProvider>(context,listen: false).SetIcon();
            }, child: Text("Pick Image")
            ),
            Expanded(
                child:  PdfPreview(
                  initialPageFormat: PdfPageFormat.a4,
                  useActions: true,
                  maxPageWidth: 700,

                  build: (format) => generateResume(format,userModel:userModel! ),
                  //  build: (format) => generateResume(format,profile_image_path: value.img_byte),
                )
            )
          ],
        ),
      ),
    );
  }
}
