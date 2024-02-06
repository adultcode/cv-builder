import 'package:flutter/cupertino.dart';

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