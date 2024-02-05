import 'package:cv_builder/mvvm/model/entity/template_model.dart';

class TemplateRepository{

  List<TemplateModel> template_list = [];
  Future<List<TemplateModel>> getTemplates()async{


    template_list.add(TemplateModel(id: 1,title: 'first',img_path: 'screen/1.PNG',selected: false));
    template_list.add(TemplateModel(id: 2,title: 'second',img_path: 'screen/2.PNG',selected: false));
    template_list.add(TemplateModel(id: 3,title: 'second',img_path: 'screen/2.PNG',selected: false));
    template_list.add(TemplateModel(id: 4,title: 'first',img_path: 'screen/1.PNG',selected: false));
    template_list.add(TemplateModel(id: 5,title: 'second',img_path: 'screen/2.PNG',selected: false));
    template_list.add(TemplateModel(id: 6,title: 'second',img_path: 'screen/2.PNG',selected: false));


    return template_list;
  }
}