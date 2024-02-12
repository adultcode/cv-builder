import 'package:cv_builder/mvvm/model/entity/education_model/education_list.dart';
import 'package:cv_builder/mvvm/model/entity/education_model/education_model.dart';
import 'package:cv_builder/mvvm/repository/education_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/custom_widgets/panel/dashboard/items/education_item.dart';

class EducationVM extends ChangeNotifier{


  // SocialModel? socialModel;
  EducationList? educationList;
  List<Widget>? education_items=[];
  EducationModel? selected_education;
  bool isForEdit = false;
  late EducationRepository  educationRepository;

  /// controllers
  ///
  var title_controller = TextEditingController();
  var grade_controller = TextEditingController();
  var university_controller = TextEditingController();
  var start_controller = TextEditingController();
  var end_controller = TextEditingController();
  var desc_controller = TextEditingController();

  EducationVM(){
    educationRepository = EducationRepository();
    educationList = EducationList();
  //  educationList?.educationList = [];

  }

  void PopulateInputs(){
    title_controller.text = selected_education!.title!;
    grade_controller.text = selected_education!.grade!;
    university_controller.text = selected_education!.university!;
    start_controller.text = selected_education!.start_date!;
    end_controller.text = selected_education!.end_date!;
    desc_controller.text = selected_education!.description!;
  }
  void SelectEducationModel(EducationModel educationModel){

    print("Selected work model clicked");
    selected_education = educationModel;
    PopulateInputs();
   // notifyListeners();
    isForEdit = true;
  }


// delete workmodel from list
  void DeleteWork(EducationModel educationModel){

    print("Selected work model e");
    selected_education = educationModel;
    educationList?.educationList?.remove(educationModel);

    // proccess list again
    education_items?.clear();
    education_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

    isForEdit = false;
    selected_education = null;
    notifyListeners();


  }

  void ClearInpust(){
    title_controller.clear();
    university_controller.clear();
    start_controller.clear();
    end_controller.clear();
    desc_controller.clear();
    grade_controller.clear();
  }

  /*
  add new workmodel in list
   */
  void AddEducation()async{

    var educationModel =  EducationModel(
          title:title_controller.text,
          university: university_controller.text,
          description: desc_controller.text,
          start_date: start_controller.text,
          grade: grade_controller.text,
          end_date: end_controller.text);

    print('length: ${educationList?.educationList}');
    if(educationList?.educationList==null || educationList?.educationList?.isEmpty==true){
      print("education list is empty");
      educationModel.id = 1;
      print("education $educationModel");

     educationList?.educationList=[educationModel];
     // educationList?.educationList?.add(educationModel);
      print('length2: ${educationList?.educationList}');


    }
    else{
      var last_id = (educationList?.educationList?.last!.id!)! ;
      last_id= last_id + 1;
      // check isForEdit is true or not
      // if true, it's edit not new item
      if(isForEdit==true){
        //find index

        int? _index = educationList?.educationList?.indexWhere((item) => item?.id == selected_education?.id);

        print("index for edit is $_index");
        if(_index!=null) {
          educationModel.id = selected_education?.id;
          educationList?.educationList?[_index] = educationModel;

        }

      }else{
        educationModel.id =last_id;
        educationList?.educationList?.add(educationModel);

      }

    }

    // worklList?.workModels?.add(work);

   education_items?.clear();
    education_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

    print("Data added");
   isForEdit = false;
   selected_education = null;
    ClearInpust();
   notifyListeners();

  }

  /*
  save list of work models
   */
  Future<bool> SaveEducationList()async{

    var result;
    if(educationList==null || educationList?.educationList?.isEmpty==true){
      print("List is empty delete all works");
      result = await educationRepository.ClearEducationist();

    }else{
      this.educationList  = educationList;
      print("Saving data:");
      result = await educationRepository.SaveWorkDataList(educationList: educationList!);


    }

    if(result==true){
      education_items?.clear();
      education_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();

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
  void GetEducationListData()async{
    try{
      var result = await educationRepository.GetEducationListData();

      educationList = result;
      education_items?.clear();
//  education_items = worklList?.workModels?.map((e) => WorkItem(e!)).toList();
      if(result!=null){
        print("Key exist");
        education_items = educationList?.educationList?.map((e) => EducationItem(educationModel: e!)).toList();
      }else{
        print("Data is null key nit exist");
        education_items = null;
      }
      //print("Get size: ${result.workModels}");


    }catch(e){
      education_items = null;

      print("Get Data:  ${e.toString()}");
    }

    notifyListeners();
    isForEdit = false;
  }

}