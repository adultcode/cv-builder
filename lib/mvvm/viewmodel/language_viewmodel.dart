import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_list.dart';
import 'package:cv_builder/mvvm/model/entity/language/language_model.dart';
import 'package:cv_builder/mvvm/model/entity/skill_model/skill_model.dart';
import 'package:cv_builder/mvvm/repository/education_repo.dart';
import 'package:cv_builder/mvvm/repository/language_repo.dart';
import 'package:cv_builder/mvvm/repository/skill_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../util/constant/color.dart';
import '../../widget/custom_widgets/panel/dashboard/items/education_item.dart';
import '../../widget/custom_widgets/panel/dashboard/items/language_item.dart';
import '../../widget/custom_widgets/panel/dashboard/items/skill_item.dart';

class LanguageVM extends ChangeNotifier{


  // SocialModel? socialModel;
  LanguageList? languageList;
  List<Widget>? lang_items=[];
  LanguageModel? selected_lang;
  bool isForEdit = false;
  late LanguageRepository  languageRepository;


  var title_controller = TextEditingController();
  var dropdownValue = 1.0;
  final allowedValues = [ 1,2,3,4,5];

  LanguageVM(){
    languageRepository = LanguageRepository();
    languageList = LanguageList();

  }

  // select item
  // populate item with selected data
  void SelectLangModel(LanguageModel language_model){

    print("Selected work model clicked");
    selected_lang = language_model;
    title_controller.text = selected_lang!.title!;
    dropdownValue = selected_lang!.percent!.toDouble();
    notifyListeners();
    isForEdit = true;
  }

void ClearInput(){
    title_controller.clear();
    dropdownValue = 1.0;
}
// get color based on id item
  // for active container of skill bar
  Color getItemBackgroundColor(int itemId) {
    switch (itemId) {
      case 0:
        return purple_bar;
      case 1:
        return red_bar;
      case 2:
        return green_bar;
      default:
      // Use modulo for other items
        return itemId % 4 == 0 ? purple_bar : itemId % 4 == 1 ? red_bar : itemId % 4 == 2 ? green_bar : yellow_bar;
    }
  }
// delete workmodel from list
  void DeleteLang(LanguageModel language_model){

    print("Selected work model e");
    selected_lang = language_model;
    languageList?.lang_list?.remove(language_model);

    // proccess list again
    lang_items?.clear();
    lang_items = languageList?.lang_list?.map((e) => LanguageItem(languageModel: e!)).toList();

    isForEdit = false;
    selected_lang = null;
    notifyListeners();


  }


  /*
  add new workmodel in list
   */
  void AddLanguage()async{

    var language_model = LanguageModel(
      title: title_controller.text,
      percent: dropdownValue.toInt()
    );
    print('length: ${languageList?.lang_list}');
    if(languageList?.lang_list==null || languageList?.lang_list?.isEmpty==true){
      print("lang list is empty");
      language_model.id = 1;
      print("lang $language_model");

      languageList?.lang_list=[language_model];
      // languageList?.languageList?.add(educationModel);
      print('length2: ${languageList?.lang_list}');


    }
    else{
      var last_id = (languageList?.lang_list?.last!.id!)! ;
      last_id= last_id + 1;
      // check isForEdit is true or not
      // if true, it's edit not new item
      if(isForEdit==true){
        //find index

        int? _index = languageList?.lang_list?.indexWhere((item) => item?.id == selected_lang?.id);

        print("index for edit is $_index");
        if(_index!=null) {
          language_model.id = selected_lang?.id;
          languageList?.lang_list?[_index] = language_model;

        }

      }else{
        language_model.id =last_id;
        languageList?.lang_list?.add(language_model);

      }

    }

    // worklList?.workModels?.add(work);

    lang_items?.clear();
    lang_items = languageList?.lang_list?.map((e) => LanguageItem(languageModel: e!)).toList();

    print("Data added");
    isForEdit = false;
    selected_lang = null;
    ClearInput();
    notifyListeners();

  }

  /*
  save list of work models
   */
  Future<bool> SavelanguageList()async{
    var result;
    if(languageList==null || languageList?.lang_list?.isEmpty==true){
      print("List is empty delete all works");
      result = await languageRepository.ClearLanguageList();

    }else{
      this.languageList  = languageList;
      print("Saving data:");
      result = await languageRepository.SaveLanguageDataList(languageList: languageList!);


    }

    if(result==true){
      lang_items?.clear();
      lang_items = languageList?.lang_list?.map((e) => LanguageItem(languageModel: e!)).toList();

      print("Data saved");
      notifyListeners();

    }else{
      // show snackbar error
      print("this is an error");
    }

    return result;
  }

  /*
  get list of work models save in shared prefences
   */
  void GetlanguageListData()async{
    try{
      var result = await languageRepository.GetLanguageListData();

      languageList = result;
      lang_items?.clear();
//  lang_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
      if(result!=null){
        print("Key exist");
        lang_items = languageList?.lang_list?.map((e) => LanguageItem(languageModel: e!)).toList();
      }else{
        print("Data is null key nit exist");
        lang_items = null;
      }
      //print("Get size: ${result.workModels}");


    }catch(e){
      lang_items = null;

      print("Get Data:  ${e.toString()}");
    }

    notifyListeners();
    isForEdit = false;
  }
  void ChangeValue(double newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }
}