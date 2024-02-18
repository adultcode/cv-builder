import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
// import 'dart:html' as html;
import 'package:path_provider/path_provider.dart';
import '../../widget/pages/cv/cv1/cv1.dart';
import '../../widget/pages/cv/cv2/cv2.dart';
import '../data_source/web_pdf_source.dart';
import '../model/entity/template_model.dart';
import '../repository/template_repo.dart';

class TemplateVM extends ChangeNotifier{

  List<TemplateModel>? template_list;
  TemplateModel? _selected_template;
 late TemplateRepository templateRepository;

  TemplateVM(){
    template_list = [];
    templateRepository = TemplateRepository();

  }

  Future<List<int>> GetTemplate(UserModel userModel)async{

    switch( getSelected() ) {

      case 1: return List.from(await generateResumeCV1(PdfPageFormat.a4,userModel:userModel ));
      case 2: return List.from(await generateResumeCV2(PdfPageFormat.a4,userModel:userModel ));
      default: return List.from(await generateResumeCV1(PdfPageFormat.a4,userModel:userModel ));

    }
  }


  // generate pdf cv for web platform
  void DownloadCVWeb(UserModel userModel) async{
    // PdfPageFormat format = PdfPageFormat();
    List<int> fileInts =await GetTemplate(userModel);
    //WebPdf.DownloadCVWeb(fileInts);
    // html.AnchorElement(
    //     href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
    //   ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
    //   ..click();

  }

Future<bool> DownloadCV(UserModel userModel)async{

    try{
      if(kIsWeb){
        late WebPdf webPdf;

        webPdf = WebPdf();

        List<int> fileInts =await GetTemplate(userModel);
      return await webPdf.DownloadCVWeb(fileInts);
      }else{
      return await DownloadCVAndroid(userModel);

      }
    }catch(e){
      return false;
    }
}
  // generate pdf cv for android platform
  Future<bool> DownloadCVAndroid(UserModel userModel) async{
    // PdfPageFormat format = PdfPageFormat();

    Directory generalDownload = Directory('/storage/emulated/0/Download');

    List<int> fileInts =await GetTemplate(userModel);
    try{
      final file = File("${generalDownload.path}/cv.pdf");
      await file.writeAsBytes(await  fileInts);
      return true;
    }catch(e){
      return false;
    }

  }

  // active current template
  void TemplateClick(TemplateModel select){

    if(_selected_template!=null){
      // unactive pre selected item
      template_list?[(_selected_template?.id)!-1].selected = false;
    }
    _selected_template = select;
    template_list?[(_selected_template?.id)!-1].selected = true;
    notifyListeners();

  }
  int? getSelected(){
    if(_selected_template!=null) return _selected_template?.id;
    else return null;
  }
  void GetTemplateList() async{
    try{
      template_list?.clear();
      _selected_template = null;
      var result = await templateRepository.getTemplates();
      if(result!=null) template_list = result;
      notifyListeners();
    }catch(e){
      debugPrint("geting list template error!");
    }
  }
}