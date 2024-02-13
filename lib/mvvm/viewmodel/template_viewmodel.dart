import 'dart:convert';

import 'package:cv_builder/mvvm/model/entity/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'dart:html' as html;

import '../../widget/pages/cv/cv1/cv1.dart';
import '../../widget/pages/cv/cv2/cv2.dart';
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

  void DownloadCVWeb(UserModel userModel) async{
    // PdfPageFormat format = PdfPageFormat();
    List<int> fileInts =await GetTemplate(userModel);
    html.AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();

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