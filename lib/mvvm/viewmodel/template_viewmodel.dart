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
import '../model/service/permission.dart';
import '../repository/template_repo.dart';

class TemplateVM extends ChangeNotifier{

  List<TemplateModel>? template_list;
  TemplateModel? _selected_template;
 late TemplateRepository templateRepository;
  late UserModel? userModel;


  bool loading = false;
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
  void DownloadCVWeb() async{
    // PdfPageFormat format = PdfPageFormat();
    List<int> fileInts =await GetTemplate(userModel!);
    //WebPdf.DownloadCVWeb(fileInts);
    // html.AnchorElement(
    //     href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
    //   ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
    //   ..click();

  }

Future<bool> DownloadCV()async{
  loading = true;
  var result = null;
  var check_permission  = await requestStoragePermission();
  if(check_permission==false || check_permission ==null) return false;
  notifyListeners();
    try{
      if(kIsWeb){
        late WebPdf webPdf;

        webPdf = WebPdf();

        List<int> fileInts =await GetTemplate(userModel!);
        result = await webPdf.DownloadCVWeb(fileInts);
        loading = false;
        notifyListeners();

        return result;

      }else{
        print("start download Android");
       result =  await DownloadCVAndroid(userModel!);
       loading = false;
        notifyListeners();

        return result;
      }
    }catch(e){
      loading = false;
      notifyListeners();

      return false;
    }
}
  // generate pdf cv for android platform
  Future<bool> DownloadCVAndroid(UserModel userModel) async{
    // PdfPageFormat format = PdfPageFormat();
    final Directory? appDir = await getExternalStorageDirectory();//use this please instead of  getExternalStorageDirectory

    Directory generalDownload = Directory('storage/emulated/0/Download');

    List<int> fileInts =await GetTemplate(userModel);
    try{
      final file = File("${generalDownload?.path}/cv.pdf");
      await file.writeAsBytes(await  fileInts);
      print("----- Downloaded: ${file.path}");
      return true;
    }catch(e){
      print("------Error download: ${e.toString()}");
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